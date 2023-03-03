Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[edit update]
  resources :posts, only: [:create, :index]
  get "/auth/twitter/callback", to: "twitter_auth#create"
  root "posts#index"
end
