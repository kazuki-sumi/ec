Rails.application.routes.draw do
  root "product_categories#index"
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  resources :product_categories do
    resources :products, only: [:index]
  end
  resources :products, except: [:index]
  resources :users, only: [:show]
  resources :carts
end
