Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'landing#index'
  resources :users

  get '/auth/signin', to: 'sessions#new'
  post '/auth/signin', to: 'sessions#create'
  post '/auth/signout', to: 'sessions#destroy'
  get '/auth/siginout', to: 'sessions#destroy'
  get '/auth/signup', to: 'users#new'
  post '/auth/signup', to: 'users#create'

end
