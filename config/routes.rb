Rails.application.routes.draw do

  devise_for :users
  resources :users,only: [:show, :edit, :update]
  resources :restaurants, except: [:destroy] do
  resources :posts, except: [:index]
  resources :favorites, only: [:create, :destroy]
  end
  resources :post_images, only:[:create, :destroy]

  get 'posts' => 'posts#index', as: 'posts'
  get 'favorites' => 'favorites#index', as: 'favorites'
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
  patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
  put 'users/withdraw' => 'users#withdraw'

  get 'about' => 'home#about'
  root 'home#top'

  get '/map_request' => 'restaurants#map', as: 'map_request'

end
