Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy] # ここを追加
  end
  
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
  
  resources :spaces do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
end

end
