Project1::Application.routes.draw do

  
  devise_for :topics
  devise_for :users
  
  resources :users

  resources :topics do
      resources :articles
  end

  resources :comments

  root to: 'welcome#index'

end
