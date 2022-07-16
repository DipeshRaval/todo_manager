Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "users", to: "users#index"
  # post "users/create", to: "users#create"
  # get "todos/:id", to: "todos#show"

  get "/", to: "home#index"
  post "users/login", to: "users#login"
  resources :todos
  resources :users

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_sessions
end
