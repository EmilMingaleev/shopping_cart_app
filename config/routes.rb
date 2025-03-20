Rails.application.routes.draw do
  root "carts#show"

  resource :cart, only: [ :show ] do
    post "clear", on: :collection
    patch "update_discount", on: :collection
  end

  resources :cart_products, only: [ :update, :destroy ]
end
