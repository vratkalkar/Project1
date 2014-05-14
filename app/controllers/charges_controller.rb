class ChargesController < ApplicationController


def new
end

def create
  # Amount in cents
  @amount = 500

  Stripe.api_key="sk_test_ZLKesvFv6Gl4jbQ6IPCUawml"

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
 end
end



