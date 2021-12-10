Rails.application.routes.draw do
  # 問い合わせフォーム
  resources :inquiries, only: [:new, :create]
  post 'inquiries/confirm' => 'inquiries#confirm', as: 'confirm'
  get 'done' => 'inquiries#done', as: 'done'
  
  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'
end
