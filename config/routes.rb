Rails.application.routes.draw do

  devise_for :users
  resources :users,only: [:show, :edit, :update]
  resources :restaurants, except: [:destroy] do
  resources :posts, except: [:index]
  resources :favorites, only: [:create, :destroy]
  end
  resources :post_images, only:[:create, :destroy]

  get 'posts' => 'posts#index', as: 'posts' #ログインユーザの投稿一覧
  get 'favorites' => 'favorites#index', as: 'favorites' #ログインユーザのお気に入り一覧
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe' #ログインユーザの退会ページ
  patch 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw_user' #ログインユーザの退会処理


  get 'about' => 'home#about'
  root 'home#top'

  get '/map_request' => 'restaurants#map', as: 'map_request'
  get 'search' => 'restaurants#search', as: 'restaurants_search'

end
