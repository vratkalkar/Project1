class ChargesController < ApplicationController

  before_action :authenticate_user!

def new
end

def create

  @user = current_user

  # Amount in cents
  @amount = 100


  Stripe.api_key="sk_test_ZLKesvFv6Gl4jbQ6IPCUawml"

  customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => "PDF: @article.title ",
    :currency    => 'usd'
  )
   
   
       redirect_to topic_article_url(@article, format: "pdf")

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
 end
end



