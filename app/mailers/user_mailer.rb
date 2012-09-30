class UserMailer < ActionMailer::Base
  default from: "unclesammy@politibuy.org"
  
  def welcome_email(user)
    mail(:to => user.email, :subject => "Invitation Request Received")
    headers['X-MC-GoogleAnalytics'] = "politibuy.org"
    headers['X-MC-Tags'] = "welcome"
  end
    
end
