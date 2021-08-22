Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'landing#index'
  resources :users

  get '/auth/signin', to: 'sessions#new'
  post '/auth/signin', to: 'sessions#create'
  get '/auth/siginout', to: 'sessions#destroy_session'
  get '/auth/signup', to: 'users#new'
  post '/auth/signup', to: 'users#create'
  get '/auth/googleLogin', to: redirect("/auth/google_oauth2")
  get "/auth/google_oauth2/callback", to: "sessions#GoogleAuth"
end
