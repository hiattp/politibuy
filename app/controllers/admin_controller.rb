class AdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end
  
  def campaigns
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @campaigns = Campaign.all
  end
  
end
