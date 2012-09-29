class WelcomeController < ApplicationController
  
  def index
    @is_landing = true;
    if user_signed_in?
      redirect_to campaigns_url
    end
  end
    
end
