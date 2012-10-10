class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :stripe_card_token
  
  # Setup accessible (or protected) attributes for your model  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, 
                  :tagline, :profile_image, :stripe_customer_id, :address_line_one, :address_line_two,
                  :zip_code, :stripe_card_token
  
  has_many :pledges
  has_many :campaigns, :through => :pledges
  
  has_attached_file :profile_image,
    :storage => :s3,
    :bucket => ENV['S3_BUCKET'],
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    },
    :s3_protocol => "https",
    :path => "users/:attachment/:id/:style.:extension"
    
  after_create :add_user_to_mailchimp unless (Rails.env.test? or Rails.env.development?)
  before_destroy :remove_user_from_mailchimp unless (Rails.env.test? or Rails.env.development?)
  
  # override Devise methods
  # no password is required when the account is created; validate password when the user sets one
  validates_confirmation_of :password
  def password_required?
    if !persisted?
      !(password != "")
    else
      !password.nil? || !password_confirmation.nil?
    end
  end
  
  # prelaunch settings - comment out to send conf emails immediately
  # override Devise method
  def confirmation_required?
    false
  end
  
  # prelaunch settings - comment out to send conf emails immediately
  # override Devise method
  def active_for_authentication?
    confirmed? || confirmation_period_valid?
  end
  
  # new function to set the password
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  # new function to determine whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # new function to provide access to protected method pending_any_confirmation
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end
  
  # save payment info
  def update_payment(card_token)
    if self.stripe_customer_id? and valid?
      customer = Stripe::Customer.retrieve(self.stripe_customer_id)
      customer.card = card_token
      customer.save
    elsif valid?
      customer = Stripe::Customer.create(email: self.email, card: card_token)
      self.stripe_customer_id = customer.id
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "Sorry, there was a problem with your credit card."
    false
  end

  private

  def add_user_to_mailchimp
    unless self.email.include?('@example.com')
      mailchimp = Hominid::API.new(ENV["MAILCHIMP_API_KEY"])
      list_id = mailchimp.find_list_id_by_name "Politibuy Updates"
      info = { }
      result = mailchimp.list_subscribe(list_id, self.email, info, 'html', false, true, false, true)
      Rails.logger.info("MAILCHIMP SUBSCRIBE: result #{result.inspect} for #{self.email}")
    end
  end

  def remove_user_from_mailchimp
    unless self.email.include?('@example.com')
      mailchimp = Hominid::API.new(ENV["MAILCHIMP_API_KEY"])
      list_id = mailchimp.find_list_id_by_name "Politibuy Updates"
      result = mailchimp.list_unsubscribe(list_id, self.email, true, false, true)  
      Rails.logger.info("MAILCHIMP UNSUBSCRIBE: result #{result.inspect} for #{self.email}")
    end
  end

  # def send_welcome_email
  #   unless self.email.include?('@example.com') && Rails.env != 'test'
  #     UserMailer.welcome_email(self).deliver
  #   end
  # end
  
  
end
