Rails.application.routes.draw do
  root "photos#index"

#  get "/users/:id" => "users#show", as: :user

  devise_for :users

  resources :comments
  resources :follow_requests
  resources :likes
  resources :photos

  get ":username/liked" => "photos#liked", as: :liked_photos
  get ":username/feed" => "users#feed", as: :feed
  get ":username/followers" => "users#followers", as: :followers
  get ":username/leaders" => "users#leaders", as: :leaders
#for followers and following: list group basic with links to the other users show pages. hint: render partials in a loop

  # initial route before replacing with the route below it
  # resources :users, only: :show
  # must be the last route because it is the most general
  get ":username" => "users#show", as: :user

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
