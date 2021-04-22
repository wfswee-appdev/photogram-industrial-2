Rails.application.routes.draw do
  root "photos#index"

#  get "/users/:id" => "users#show", as: :user

  devise_for :users

  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos

  # initial route before replacing with the route below it
  # resources :users, only: :show
  
  # must be the last route because it is the most general
  get "/:username" => "users#show"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
