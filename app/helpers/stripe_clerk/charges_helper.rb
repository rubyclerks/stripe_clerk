module StripeClerk
  module ChargesHelper

    # determine if the given user has ordered by card and if so return the charge
    # given user may be nil, in which case nil is returned (save caller checking)
    # nil is also returned if no stripe order was placed
    # from the returned charge one may get the card (to display last4) or
    #    the customer to create a new charge (with the charge_customer method)
    def has_charge user
      return nil unless user
      order = Order.where(email: user.email).where(payment_type: :stripe).order(:ordered_on).last
      return nil unless order
      Stripe::Charge.retrieve(order.payment_info)
    end

    # reusable helper to charge given customer_id for given order
    # orders save the charge_id, so customers may be re-charged using that
    # (has_charge helper will return the latest charge for a user and .customer will give it's id)
    # Throws any StripeError , specifically CardError
    #
    def charge_customer customer_id , order
      charge = Stripe::Charge.create(
        :customer    => customer_id,
        :amount      => (order.total_price*100).to_i,
        :description => t(:order) + " : " + order.number ,
        :currency    => 'eur'
      )

      order.pay_now
      order.payment_info = charge.id
      order.payment_type = "stripe"
      order.save
    end

  end
end
