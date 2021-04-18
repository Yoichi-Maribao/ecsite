Rails.application.routes.draw do
  namespace :admin do
    resources :customers, except: [:create, :new, :destroy]
  end
  devise_for :admins, path: :admin, skip: 'registrations'
  devise_for :end_users
  devise_scope :end_user do
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end
  namespace :admin do
    get '/', to: 'homes#top'
  end
  scope module: :public do
    get 'customers/mypage', to: 'customers#show'
    get 'customers/edit'
    patch 'customers', to: 'customers#update'
    get 'customers/unsubscribe'
    patch 'customers/withdraw', to: 'customers#withdraw'
  end

  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
