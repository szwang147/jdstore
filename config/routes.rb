Rails.application.routes.draw do
root 'products#index'
devise_for :users
  namespace :admin do
   resources :products
      resources :orders do
        member do
          post :cancel
          post :deliver
        end
      end

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

 resources :orders do
   member do
     post :pay_with_alipay
     post :pay_with_wechat
   end
 end
 resources :cart_items

 namespace :account do
     resources :orders do
     member do
       post :cancelling
     end
   end
  end


  end
