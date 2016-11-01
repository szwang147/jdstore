Rails.application.routes.draw do
root 'products#index'
devise_for :users
  namespace :admin do
   resources :products
 end

  resources :products do
  member do
     post :add_to_cart
   end
 end
 resources :carts do
     collection do
       post :checkout
     end
   end
 resources :carts
 resources :orders do
   method do
      post :pay_with_wechat
      post :pay_with_alipay
    end
end
  end
