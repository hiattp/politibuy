class KeyPolicyMakersController < ApplicationController
  # GET /key_policy_makers
  # GET /key_policy_makers.json
  def index
    @key_policy_makers = KeyPolicyMaker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @key_policy_makers }
    end
  end

  # GET /key_policy_makers/1
  # GET /key_policy_makers/1.json
  def show
    @key_policy_maker = KeyPolicyMaker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @key_policy_maker }
    end
  end

  # GET /key_policy_makers/new
  # GET /key_policy_makers/new.json
  def new
    @key_policy_maker = KeyPolicyMaker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @key_policy_maker }
    end
  end

  # GET /key_policy_makers/1/edit
  def edit
    @key_policy_maker = KeyPolicyMaker.find(params[:id])
  end

  # POST /key_policy_makers
  # POST /key_policy_makers.json
  def create
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
    @key_policy_maker = KeyPolicyMaker.find(params[:id])
    @key_policy_maker.destroy

    respond_to do |format|
      format.html { redirect_to key_policy_makers_url }
      format.json { head :no_content }
    end
  end
end
