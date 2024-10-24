Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    get 'dashboard/show/:id', to: 'dashboards#show', as: 'dashboard_show'
    resources :users, only: [:show,:destroy] 
  end
  
  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources:spaces
    resources:users
    get 'search', to: 'searches#search'
    resources :spaces do
      resource :favorites, only: [:create, :destroy]
      resources :favorites, only: [:index,]
      resources :comments, only: [:create, :destroy]
    end
  end
  
  
  #ゲストログイン用ルート
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
