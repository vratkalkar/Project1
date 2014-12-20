
class ChargesController < ApplicationController

  before_action :authenticate_user!

def new
end

def create

# amount in cents

  @amount = 100


  Stripe.api_key

  customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => "PDF Download",
    :currency    => 'usd'
  )

 if charge
  article = Article.friendly.find(params[:article_id])
  payment = Payment.new(payment_param)
  payment.user_id = current_user.id
  payment.article_id = article.id
  payment.save

  redirect_to :back
  flash[:notice]= "Thanks for your payment! A receipt has been sent to your email address."
 end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
 end
end


private

def payment_param
   params.permit(:user_id, :article_id)
end



