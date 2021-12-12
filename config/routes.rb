Rails.application.routes.draw do
  # 問い合わせフォーム
  post 'contacts/confirm' => 'contacts#confirm', as: 'confirm'
  get 'contacts/done' => 'contacts#done', as: 'done'
  resources :contacts, only: [:new, :create]

  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'
end
