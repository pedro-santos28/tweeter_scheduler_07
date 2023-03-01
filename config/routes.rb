Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:create, :index]
  root "posts#index"
end
