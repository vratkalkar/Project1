Project1::Application.routes.draw do

  
  devise_for :users
  resources :users

  resources :topics do
   resources :articles
  end

    resources :charges
   resources :comments

  resources :contact_forms

  match '/topics/:topic_id/articles/:id/edit',  to: 'articles#show', via: :post


  root to: 'welcome#index'

end
