class ContactFormsController < ApplicationController
  respond_to :html

def index
end

def new
  @contact_form = ContactForm.new(contact_params)
end

def create
  @contact_form = ContactForm.new(params[:contact_form])
  if @contact_form.deliver
    redirect_to root_path, :notice => "Email has been sent."
  else
   redirect :back, :notice => "Email could not be sent. All fields required."
  end
 end
end

private

def contact_params
  params.permit(:name, :email, :message)
end
