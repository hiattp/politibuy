class UpdatesController < ApplicationController
  before_filter :authenticate_user!
  # GET /updates
  # GET /updates.json
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @updates = Update.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @updates }
    end
  end

  # GET /updates/1
  # GET /updates/1.json
  def show
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @update = Update.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @update }
    end
  end

  # GET /updates/new
  # GET /updates/new.json
  def new
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @update = Update.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @update }
    end
  end

  # GET /updates/1/edit
  def edit
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @update = Update.find(params[:id])
  end

  # POST /updates
  # POST /updates.json
  def create
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @update = Update.new(params[:update])
    @update.campaign_id = params[:campaign_id]

    respond_to do |format|
      if @update.save
        format.html { redirect_to :back, notice: 'Update was successfully created.' }
        format.json { render json: @update, status: :created, location: @update }
      else
        format.html { redirect_to :back, notice: 'Update not saved successfully.' }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /updates/1
  # PUT /updates/1.json
  def update
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @update = Update.find(params[:id])

    respond_to do |format|
      if @update.update_attributes(params[:update])
        format.html { redirect_to :back, notice: 'Update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to updates_url }
      format.json { head :no_content }
    end
  end
end
