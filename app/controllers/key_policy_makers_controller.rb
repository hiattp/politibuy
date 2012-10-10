class KeyPolicyMakersController < ApplicationController
  # GET /key_policy_makers
  # GET /key_policy_makers.json
  def index
    @campaigns = Campaign.all
    @campaign = Campaign.find(params[:campaign_id])
    @key_policy_makers = @campaign.key_policy_makers
    if user_signed_in? and @campaign.users.include? current_user
      @user_pledge = current_user.pledges.where(:campaign_id => @campaign.id).first
    else
      @user_pledge = false
    end
  end

  # GET /key_policy_makers/1
  # GET /key_policy_makers/1.json
  def show
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @key_policy_maker = KeyPolicyMaker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @key_policy_maker }
    end
  end

  # GET /key_policy_makers/new
  # GET /key_policy_makers/new.json
  def new
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @key_policy_maker = KeyPolicyMaker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @key_policy_maker }
    end
  end

  # GET /key_policy_makers/1/edit
  def edit
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @key_policy_maker = KeyPolicyMaker.find(params[:id])
  end

  # POST /key_policy_makers
  # POST /key_policy_makers.json
  def create
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @key_policy_maker = KeyPolicyMaker.new(params[:key_policy_maker])

    respond_to do |format|
      if @key_policy_maker.save
        format.html { redirect_to :back, notice: 'Key policy maker successfully created.' }
        format.json { render json: @key_policy_maker, status: :created, location: @key_policy_maker }
      else
        format.html { render action: "new" }
        format.json { render json: @key_policy_maker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /key_policy_makers/1
  # PUT /key_policy_makers/1.json
  def update
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @key_policy_maker = KeyPolicyMaker.find(params[:id])

    respond_to do |format|
      if @key_policy_maker.update_attributes(params[:key_policy_maker])
        format.html { redirect_to :back, notice: 'Key policy maker successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @key_policy_maker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_policy_makers/1
  # DELETE /key_policy_makers/1.json
  def destroy
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @key_policy_maker = KeyPolicyMaker.find(params[:id])
    @key_policy_maker.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
