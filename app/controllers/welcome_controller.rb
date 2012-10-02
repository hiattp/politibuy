class WelcomeController < ApplicationController
  
  def index
    @is_landing = true;
    if user_signed_in?
      redirect_to campaigns_url
    end
  end
  
  def about
  end
  
  def terms
  end
  
  def privacy
  end
  
  def ethics
  end
    
end
