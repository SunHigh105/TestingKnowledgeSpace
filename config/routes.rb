Rails.application.routes.draw do
  root 'static_pages#home'
  # Users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/edit_profile', to: 'users#edit'
  put '/edit_profile', to: 'users#update'
  get '/mypage', to: 'users#mypage'
  delete 'users/delete'
  # Articles
  get '/articles', to: 'articles#index'
  get 'articles/show'
  get '/post', to: 'articles#new'
  post '/post', to: 'articles#create'
  get '/edit_article', to: 'articles#edit'
  put '/edit_article', to: 'articles#update'
  delete 'articles/delete'
  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  
  resources :users
  resources :article
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
