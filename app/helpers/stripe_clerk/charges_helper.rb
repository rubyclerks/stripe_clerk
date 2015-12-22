module StripeClerk
  module ChargesHelper

    # determine if the given user has ordered by card and if so return that order
    # given user may be nil, in which case nil is returned (save caler checking)
    # nil is also returned if no stripe order was placed
    def used_card user
      return nil unless user
      Order.where(email: user.email).where(payment_type: :stripe).order(:ordered_on).last
    end

    # reusable helper to charge given customer_id for given order
    # orders save the customer_id, so customers may be re-charged using that
    #
    # Throws any StripeError , specifically CardError
    #
    def charge_customer customer_id , order
      Stripe::Charge.create(
        :customer    => customer_id,
        :amount      => (order.total_price*100).to_i,
        :description => t(:order) + " : " + order.number ,
        :currency    => 'eur'
      )

      order.pay_now
      order.payment_info = customer_id
      order.payment_type = "stripe"
      order.save
    end

  end
end
