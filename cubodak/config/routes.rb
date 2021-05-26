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
  get '/auth/googleLogin', to: redirect("/auth/google_oauth2")
  get "/auth/google_oauth2/callback", to: "sessions#GoogleAuth"
  get "/upload_product", to: 'users#upload'
  post "/upload_product", to: 'users#upload_product'
end
