Rails.application.routes.draw do

  devise_for :users
  resources :users,only: [:show, :edit, :update]
  resources :restaurants, except: [:destroy]
  resources :posts
  resources :post_images, only:[:create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]


  get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
  patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_customer'
  put 'users/withdraw' => 'users#withdraw'

  get 'about' => 'home#about'
  get 'root' => 'home#top'

end
