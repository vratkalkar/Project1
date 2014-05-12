Project1::Application.routes.draw do

  
  devise_for :users
  resources :users

  resources :topics 

  resources :articles


  resources :comments

  mount EpicEditor::Engine => "/"

  root to: 'welcome#index'

end
