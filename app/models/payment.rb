class Payment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :stripe_token, :last_4_digits, :subscription_type
  attr_accessor :stripe_token

  before_save :update_stripe

  after_save :send_payment_status

  validates :last_4_digits, :presence => true

  YEARLY_PLAN = 'simple_plan'
  LIFE_TIME_PLAN = 'life_time_plan'
  

  def update_stripe
    if stripe_token.present?
      if stripe_id.nil?
        customer = Stripe::Customer.create(
          :description => self.user.email,
          :card => stripe_token
        )
        self.last_4_digits = customer.active_card.last4

        if self.subscription_type == YEARLY_PLAN
        response = customer.update_subscription({:plan => self.subscription_type})
        elsif self.subscription_type == LIFE_TIME_PLAN
          invoice = Stripe::InvoiceItem.create( :customer => customer,
            :amount => 14900,
            :currency => "usd",
            :description => LIFE_TIME_PLAN )
          self.transaction_number = invoice.id
        end

      else
        customer = Stripe::Customer.retrieve(stripe_id)
        customer.card = stripe_token
        customer.save
        self.last_4_digits = customer.active_card.last4
      end

      self.stripe_id = customer.id
      self.stripe_token = nil
    elsif last_4_digits_changed?
      self.last_4_digits = last_4_digits_was
    end
  end

  def send_payment_status
    NotificationMailer.payment_status_of_yearly_plan(self.user).deliver if self.subscription_type == YEARLY_PLAN
    NotificationMailer.payment_status_of_life_time_plan(self.user).deliver if self.subscription_type == LIFE_TIME_PLAN
  end


end
