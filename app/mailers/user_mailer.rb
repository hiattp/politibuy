class UserMailer < ActionMailer::Base
  default from: "unclesammy@politibuy.org"
  
  def welcome_email(user)
    mail(:to => user.email, :subject => "Invitation Request Received")
    headers['X-MC-GoogleAnalytics'] = "politibuy.org"
    headers['X-MC-Tags'] = "welcome"
  end
  
  # Mandrill template
  # In a controller: YourMailer.email_name.deliver
  # def email_name
  #   mail :subject => "Mandrill rides the Rails!",
  #        :to      => "recipient@example.com",
  #        :from    => "you@yourdomain.com"
  # end
    
end
