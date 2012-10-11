class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign

  attr_accessor :stripe_card_token
  attr_accessible :amount, :campaign_id, :user_id, :stripe_card_token
  
  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(email: self.user.email, card: stripe_card_token)
      self.user.stripe_customer_id = customer.id
      self.user.save!
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "Sorry, there was a problem with your credit card."
    false
  rescue Stripe::CardError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, e.message
    false
  end
    
end
