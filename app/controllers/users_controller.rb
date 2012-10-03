class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end
  
  def invite
    authorize! :invite, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    @user.send_confirmation_instructions
    redirect_to :back, :only_path => true, :notice => "Sent invitation to #{@user.email}."
  end
  
end