Rails.application.routes.draw do

  devise_for :users

  # 問い合わせフォーム
  post 'contacts/confirm' => 'contacts#confirm', as: 'confirm'
  get 'contacts/done' => 'contacts#done', as: 'done'
  resources :contacts, only: [:new, :create]

  # ホーム画面関連
  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'

  #カテゴリー分けのために新設
  get 'posts/shops' => 'posts#shop', as: 'shop'
  get 'posts/toasts' => 'posts#toast', as: 'toast'
  get 'posts/sandwiches' => 'posts#sandwich', as: 'sandwich'

  # 投稿関連
  resources :posts

  resources :users, only: [:show, :edit]
end
