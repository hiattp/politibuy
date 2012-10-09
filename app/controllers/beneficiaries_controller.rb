class BeneficiariesController < ApplicationController
  # GET /beneficiaries
  # GET /beneficiaries.json
  def index
    @beneficiaries = Beneficiary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @beneficiaries }
    end
  end

  # GET /beneficiaries/1
  # GET /beneficiaries/1.json
  def show
    @beneficiary = Beneficiary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @beneficiary }
    end
  end

  # GET /beneficiaries/new
  # GET /beneficiaries/new.json
  def new
    @beneficiary = Beneficiary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @beneficiary }
    end
  end

  # GET /beneficiaries/1/edit
  def edit
    @beneficiary = Beneficiary.find(params[:id])
  end

  # POST /beneficiaries
  # POST /beneficiaries.json
  def create
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
    @beneficiary = Beneficiary.find(params[:id])

    respond_to do |format|
      if @beneficiary.update_attributes(params[:beneficiary])
        format.html { redirect_to @beneficiary, notice: 'Beneficiary was successfully updated.' }
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
    @beneficiary = Beneficiary.find(params[:id])
    @beneficiary.destroy

    respond_to do |format|
      format.html { redirect_to beneficiaries_url }
      format.json { head :no_content }
    end
  end
end
