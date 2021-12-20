Rails.application.routes.draw do

  devise_for :users

  # 問い合わせフォーム
  post 'contacts/confirm' => 'contacts#confirm', as: 'confirm'
  get 'contacts/done' => 'contacts#done', as: 'done'
  resources :contacts, only: [:new, :create]

  # ホーム画面関連
  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'

  # 投稿関連
  resources :shops
  resources :toasts

  resources :users, only: [:show, :edit]
end
