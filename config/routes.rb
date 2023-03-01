Rails.application.routes.draw do
  resources :posts, only: [:create, :index]
  root "posts#index"
end
