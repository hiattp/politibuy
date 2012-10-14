class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def unzip_code

    zip_results = Zipper.get_city_and_state(params[:zip])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: zip_results }
    end
    
  end
    
  def invite
    authorize! :invite, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    @user.send_confirmation_instructions
    redirect_to :back, :only_path => true, :notice => "Sent invitation to #{@user.email}."
  end
  
  def bulk_invite
    authorize! :bulk_invite, @user, :message => 'Not authorized as an administrator.'
    users = User.where(:confirmation_token => nil).order(:created_at).limit(params[:quantity])
    users.each do |user|
      user.send_confirmation_instructions
    end
    redirect_to :back, :only_path => true, :notice => "Sent invitation to #{users.count} users."
  end
  
end