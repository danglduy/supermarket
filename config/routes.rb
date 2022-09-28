Rails.application.routes.draw do
  root "home#index"

  resources :products
  resources :checkout_items
end
