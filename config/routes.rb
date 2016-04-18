Rails.application.routes.draw do

  devise_for :admins
  namespace :staff do
    root 'root#index'

    resources :categories
    resources :configs, only: [:index, :new, :update, :create]
    # resources :dashboard, only: [:index]
  end

  get '/shop', to: redirect('/shop/categories')
  namespace :shop do
    resources :categories, only: [:index, :show]
  end

  namespace :site, path: '/' do
    root 'pages#index'
    # resources :pages, only: [:index]
  end

end
