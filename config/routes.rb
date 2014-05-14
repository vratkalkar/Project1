Project1::Application.routes.draw do

  
  devise_for :users
  resources :users

  resources :topics do
   resources :articles
  end
    resources :charges
   resources :comments

  
  root to: 'welcome#index'

end
