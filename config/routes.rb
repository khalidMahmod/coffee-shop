Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :carts, only: :show do
        collection do
          post :add
        end
      end
      resources :discounts, only: :create
      resources :orders, only: :create
    end
  end
  root 'api/v1/items#index'
end
