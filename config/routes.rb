Rails.application.routes.draw do
  root "home#index"

  resources :products
  # root "articles#index"
end
