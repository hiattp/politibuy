class VehiclesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /vehicles
  # GET /vehicles.json
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @vehicles = Vehicle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicles }
    end
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/new
  # GET /vehicles/new.json
  def new
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @vehicle = Vehicle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/1/edit
  def edit
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @breadcrumb_campaign_id = params[:breadcrumb_campaign_id]
    @vehicle = Vehicle.find(params[:id])
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @vehicle = Vehicle.new(params[:vehicle])

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to :back, notice: 'Vehicle was successfully created.' }
        format.json { render json: @vehicle, status: :created, location: @vehicle }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end  

  # PUT /vehicles/1
  # PUT /vehicles/1.json
  def update
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @vehicle = Vehicle.find(params[:id])
    @breadcrumb_campaign = Campaign.find(params[:breadcrumb_campaign_id])
    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        format.html { redirect_to edit_campaign_path(@breadcrumb_campaign), notice: 'Vehicle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url }
      format.json { head :no_content }
    end
  end
end
