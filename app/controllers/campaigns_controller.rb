class CampaignsController < ApplicationController
  # remove before filter after closed beta
  before_filter :authenticate_user! 
  
  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.where(:live => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaigns }
    end
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    @campaigns = Campaign.where(:live => true)
    @campaign = Campaign.find(params[:id])
    @deadline = @campaign.deadline.utc
    if user_signed_in? and @campaign.users.include? current_user
      @user_pledge = current_user.pledges.where(:campaign_id => @campaign.id).first
    else
      @user_pledge = false
    end
    puts @user_pledge
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campaign }
    end
  end

  # GET /campaigns/new
  # GET /campaigns/new.json
  def new
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @campaign = Campaign.new
    @updating = false

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @campaign }
    end
  end

  # GET /campaigns/1/edit
  def edit
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @campaign = Campaign.find(params[:id])
    
    @updating = true
    @new_update = @campaign.updates.build
    
    policy_makers = PolicyMaker.all
    @policy_makers_selections = []
    policy_makers.map do |pm|
      name = pm.last_name + ", " + pm.first_name
      @policy_makers_selections << [name, pm.id]
    end
    
    vehicles = Vehicle.all
    @vehicle_selections = []
    vehicles.map do |v|
      name = v.name
      @vehicle_selections << [name, v.id]
    end
    
    @new_policy_maker = PolicyMaker.new
    @new_key_policy_maker = @campaign.key_policy_makers.build
    # KeyPolicyMaker.new
    
    @new_vehicle = Vehicle.new
    # @new_beneficiary = Beneficiary.new
    @new_beneficiary = @campaign.beneficiaries.build
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @campaign = Campaign.new(params[:campaign])

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render json: @campaign, status: :created, location: @campaign }
      else
        format.html { render action: "new" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /campaigns/1
  # PUT /campaigns/1.json
  def update
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @campaign = Campaign.find(params[:id])
    
    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    authenticate_user!
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to campaigns_url }
      format.json { head :no_content }
    end
  end
end
