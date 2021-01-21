Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  resources :users
  resources :books
  get   'contact'         => 'contact#new'     # 入力画面
  post  'contact/confirm' => 'contact#confirm'   # 確認画面
  post  'contact/thanks'  => 'contact#thanks'    # 送信完了画面
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end

