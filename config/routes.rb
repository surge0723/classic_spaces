Rails.application.routes.draw do

  get 'searches/search'
  devise_for :users
  resources:spaces
  resources:users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get 'search', to: 'searches#search'
  
  #ゲストログイン用ルート
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

end
