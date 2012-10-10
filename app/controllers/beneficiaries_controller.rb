class BeneficiariesController < ApplicationController
  before_filter :authenticate_user!
  # GET /beneficiaries
  # GET /beneficiaries.json
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @beneficiaries = Beneficiary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @beneficiaries }
    end
  end

  # GET /beneficiaries/1
  # GET /beneficiaries/1.json
  def show
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @beneficiary = Beneficiary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @beneficiary }
    end
  end

  # GET /beneficiaries/new
  # GET /beneficiaries/new.json
  def new
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @beneficiary = Beneficiary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @beneficiary }
    end
  end

  # GET /beneficiaries/1/edit
  def edit
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @beneficiary = Beneficiary.find(params[:id])
  end

  # POST /beneficiaries
  # POST /beneficiaries.json
  def create
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @beneficiary = Beneficiary.new(params[:beneficiary])

    respond_to do |format|
      if @beneficiary.save
        format.html { redirect_to :back, notice: 'Beneficiary was successfully created.' }
        format.json { render json: @beneficiary, status: :created, location: @beneficiary }
      else
        format.html { render action: "new" }
        format.json { render json: @beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /beneficiaries/1
  # PUT /beneficiaries/1.json
  def update
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @beneficiary = Beneficiary.find(params[:id])

    respond_to do |format|
      if @beneficiary.update_attributes(params[:beneficiary])
        format.html { redirect_to :back, notice: 'Beneficiary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beneficiaries/1
  # DELETE /beneficiaries/1.json
  def destroy
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @beneficiary = Beneficiary.find(params[:id])
    @beneficiary.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
