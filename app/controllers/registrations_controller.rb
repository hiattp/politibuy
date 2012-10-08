class RegistrationsController < Devise::RegistrationsController

  # override #create to respond to AJAX with a partial
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        sign_in(resource_name, resource)
        (render(:partial => 'thankyou', :layout => false) && return)  if request.xhr?
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        expire_session_data_after_sign_in!
        (render(:partial => 'thankyou', :layout => false) && return)  if request.xhr?
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      render :action => :new, :layout => !request.xhr?
    end
    
  end
  
  # GET /resource/edit
  def edit
    if current_user.stripe_customer_id?
      @customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    else
      @customer = false
    end
    render :edit
  end
  
  
  def update
    @user = User.find(current_user.id)
    email_changed = @user.email != params[:user][:email]
    if not params[:user][:password].nil?
      password_changed = !params[:user][:password].empty?
    else 
      password_changed = false
    end

    successfully_updated = if email_changed or password_changed
      puts 'HEREEE IN WITH PASSWORD'
      @user.update_with_password(params[:user])
    else
      puts 'HEREEREREEE'
      params[:user].delete("current_password")
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to edit_user_registration_path
    else
      render "edit"
    end
  end
  
  

  protected

  def after_inactive_sign_up_path_for(resource)
    flash[:notice] = "Thanks! Please check your email for activation instructions."
    respond_to?(:root_path) ? root_path : "/"
  end
    
  def after_sign_up_path_for(resource)
    # the page new users will see after sign up (after launch, when no invitation is needed)
    redirect_to root_path
  end
  
end