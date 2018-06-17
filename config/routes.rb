Rails.application.routes.draw do
  root 'static_pages#home'
  # Users
  resources :users
  # Articles
  resources :articles
  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
