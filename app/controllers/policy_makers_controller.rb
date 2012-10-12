class PolicyMakersController < ApplicationController
  # GET /policy_makers
  # GET /policy_makers.json
  def index
    @policy_makers = PolicyMaker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @policy_makers }
    end
  end

  # GET /policy_makers/1
  # GET /policy_makers/1.json
  def show
    @policy_maker = PolicyMaker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @policy_maker }
    end
  end

  # GET /policy_makers/new
  # GET /policy_makers/new.json
  def new
    @policy_maker = PolicyMaker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @policy_maker }
    end
  end

  # GET /policy_makers/1/edit
  def edit
    @policy_maker = PolicyMaker.find(params[:id])
    @breadcrumb_campaign_id = params[:breadcrumb_campaign_id]
  end

  # POST /policy_makers
  # POST /policy_makers.json
  def create
    @policy_maker = PolicyMaker.new(params[:policy_maker])

    respond_to do |format|
      if @policy_maker.save
        format.html { redirect_to :back, notice: 'Policy maker was successfully created.' }
        format.json { render json: @policy_maker, status: :created, location: @policy_maker }
      else
        format.html { render action: "new" }
        format.json { render json: @policy_maker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /policy_makers/1
  # PUT /policy_makers/1.json
  def update
    @policy_maker = PolicyMaker.find(params[:id])
    # only applicable when you can only edit a policy maker from a campaign page
    # in future, list campaigns a policy maker is involved in on the right to navigate back
    @breadcrumb_campaign = Campaign.find(params[:breadcrumb_campaign_id])
    respond_to do |format|
      if @policy_maker.update_attributes(params[:policy_maker])
        format.html { redirect_to edit_campaign_path(@breadcrumb_campaign), notice: 'Policy maker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @policy_maker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policy_makers/1
  # DELETE /policy_makers/1.json
  def destroy
    @policy_maker = PolicyMaker.find(params[:id])
    @policy_maker.destroy

    respond_to do |format|
      format.html { redirect_to policy_makers_url }
      format.json { head :no_content }
    end
  end
end
