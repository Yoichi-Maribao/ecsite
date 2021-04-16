Rails.application.routes.draw do
  devise_for :admins, path: :admin, skip: 'registrations'
  devise_for :end_users, parh: :public

  namespace :admin do
    get '/', to: 'homes#top'
  end
  scope module: :public do
    get 'customers/mypage', to: 'customers#show'
    get 'customers/edit'
    patch 'customers/update'
    delete 'customers/unsubscribe'
    delete 'customers/withdraw'
  end

  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
