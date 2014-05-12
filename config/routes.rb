Project1::Application.routes.draw do

  
  devise_for :users
  resources :users

  resources :topics do
      resources :articles
  end

  resources :comments

  mount EpicEditor::Engine => "/"

  post '/topics/:id/articles/new', to: 'articles#show'

  root to: 'welcome#index'

end
