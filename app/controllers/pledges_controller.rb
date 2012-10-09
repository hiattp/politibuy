class PledgesController < ApplicationController
  before_filter :authenticate_user!
  # GET /pledges
  # GET /pledges.json
  def index
    @pledges = Pledge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pledges }
    end
  end

  # GET /pledges/1
  # GET /pledges/1.json
  def show
    @pledge = Pledge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pledge }
    end
  end

  # GET /pledges/new
  # GET /pledges/new.json
  def new
    @new_pledge = true
    @pledge = Pledge.new
    if current_user.stripe_customer_id?
      @customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    else
      @customer = false
    end
    @campaign = Campaign.find(params[:campaign_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pledge }
    end
  end

  # GET /pledges/1/edit
  def edit
    @pledge = Pledge.find(params[:id])
  end

  # POST /pledges
  # POST /pledges.json
  def create
    if current_user.update_without_password(params[:user])
      @pledge = Pledge.new(params[:pledge])
      if current_user.stripe_customer_id?
        @pledge.save!
        redirect_to @pledge.campaign, :notice => "Pledge created successfully!"
      elsif @pledge.save_with_payment
        redirect_to @pledge.campaign, :notice => "Pledge created successfully!"
      else
        render :new
      end
    else
      render :new      
    end
  end

  # PUT /pledges/1
  # PUT /pledges/1.json
  def update
    @pledge = Pledge.find(params[:id])

    respond_to do |format|
      if @pledge.update_attributes(params[:pledge])
        format.html { redirect_to @pledge, notice: 'Pledge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pledges/1
  # DELETE /pledges/1.json
  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy

    respond_to do |format|
      format.html { redirect_to pledges_url }
      format.json { head :no_content }
    end
  end
end
