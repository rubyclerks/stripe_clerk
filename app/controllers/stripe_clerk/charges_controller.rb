require_dependency "stripe_clerk/application_controller"

module StripeClerk
  class ChargesController < ApplicationController

  include ChargesHelper

  def new
  end

  def show
    @order = Order.find( session[:order] )
  end

  def create
    order = Order.find( session[:order] )

    customer = Stripe::Customer.create(
      :email => order.email ,
      :card  => params[:stripeToken]
    )

    charge_customer customer.id , order

    redirect_to main_app.shop_order_path

  rescue Stripe::StripeError => e  # nothing must escape, CardError is just a subset
    flash[:error] = e.message
    redirect_to charges_path
  end
  end
end
