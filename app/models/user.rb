class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :company, :dependent => :destroy

  FREE_TRIAL_DAYS = 20

  def create_customer(stripeToken)
	  customer = Stripe::Customer.create(
    :email => email,
    :card  => stripeToken,
    :plan => '1'
  	)

  	self.stripe_customer_token = customer.id
  	self.save
  end

  def days_count
    (created_at.to_date + User::FREE_TRIAL_DAYS.days) - Date.today
  end  

  def remaining_days
    if days_count > 0
      days_count
    else
      0
    end
  end

  def trial_expired?
    remaining_days <= 0
  end

  def no_subscription?
  	stripe_customer_token.blank?
  end

  def needs_subscription?
  	trial_expired? && no_subscription?
  end

  def delete_customer
    customer = Stripe::Customer.retrieve(stripe_customer_token)
    customer.delete
    self.stripe_customer_token = nil
    self.save
  end

end
