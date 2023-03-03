Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[edit update]
  resources :posts, only: [:create, :index]
  root "posts#index"
end
