Project1::Application.routes.draw do

  
  devise_for :users
  resources :users

  resources :topics do
      resources :articles
  end

  resources :comments

  mount EpicEditor::Engine => "/"


  root to: 'welcome#index'

end
