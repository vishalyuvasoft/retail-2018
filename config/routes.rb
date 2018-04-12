Rails.application.routes.draw do
  root to: "products#index"

  devise_for :users

  resources :products, only: [:index, :new, :create]
  resources :orders, only: [:index, :new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
