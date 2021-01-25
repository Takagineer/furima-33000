Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items
  resources :orders, only: :index do
   resources :orders, only: :create
  end
end
