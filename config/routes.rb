Project1::Application.routes.draw do

  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  resources :users

  devise_scope :user do
    get 'sign_out', :to => 'devise/session#destroy'
  end

  resources :topics do
   resources :articles
  end

    resources :charges
   resources :comments


  resources :contact_forms

  root to: 'welcome#index'

end
