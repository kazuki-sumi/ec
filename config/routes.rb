Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :categories
  resources :products
  resources :users, only: [:show]
  resources :carts do
    resources :cart_items, only: [:create, :update]
  end

  get "*unmatched_route", to: "application#routing_error"
end
