Rails.application.routes.draw do

  devise_for :users

  # 問い合わせフォーム
  post 'contacts/confirm' => 'contacts#confirm', as: 'confirm'
  get 'contacts/confirm' => 'contacts#confirm', as: 'confirm_get'
  get 'contacts/done' => 'contacts#done', as: 'done'
  resources :contacts, only: [:new, :create]

  # ホーム画面関連
  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'

  #投稿関連
  get 'posts/shops' => 'posts#shop', as: 'shop'
  get 'posts/toasts' => 'posts#toast', as: 'toast'
  get 'posts/sandwiches' => 'posts#sandwich', as: 'sandwich'
  get 'posts/search' => 'posts#search', as: 'search'
  resources :posts, except: [:index] do
    resource :bookmarks, only: [:create, :destroy]
  end

  get 'users/bookmarks' => 'users#bookmark', as: 'bookmark'
  resources :users, only: [:show, :edit]
end
