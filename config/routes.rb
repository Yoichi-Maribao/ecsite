Rails.application.routes.draw do
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
    resources :orders, only: [:show, :update, :index]
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
    get 'orders/thanks', to: 'orders#thanks'
    resources :orders, except: [:edit, :update, :destroy] do
      # scope module:  :orders do
      post 'confirm', to: 'orders#confirm'
      # end
    end
    resources :addresses, except: [:show, :new]
  end

  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
