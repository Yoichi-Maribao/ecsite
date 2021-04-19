Rails.application.routes.draw do
  namespace :public do
    get 'cart_items/index'
  end
  devise_for :admins, path: :admin, skip: 'registrations'
  devise_for :end_users

  devise_scope :end_user do
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  namespace :admin do
    get '/', to: 'homes#top'
    resources :customers, except: [:create, :new, :destroy]
    resources :genres, except: [:new, :show]
    resources :items, except: :destroy
  end

  scope module: :public do
    get 'customers/mypage', to: 'customers#show'
    get 'customers/edit'
    patch 'customers', to: 'customers#update'
    get 'customers/unsubscribe'
    patch 'customers/withdraw', to: 'customers#withdraw'
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    resources :cart_items, except: [:new, :show, :edit]
  end

  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
