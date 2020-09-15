Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
    resources :comments, only:[:create,:destroy]
  end
  resources :items,   only:[:new,:create,:destroy]
  resources :users, only: :show
  resources :weather, only: :index
end
