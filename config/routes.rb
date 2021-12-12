Rails.application.routes.draw do
  # 問い合わせフォーム
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm' => 'contacts#confirm', as: 'confirm'
  get 'done' => 'contacts#done', as: 'done'
  
  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'
end
