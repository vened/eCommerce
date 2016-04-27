Rails.application.routes.draw do

  root 'pages#index'

  devise_for :admins

  mount Ckeditor::Engine => '/ckeditor'

  namespace :staff do
    root 'root#index'
    resources :categories
    resources :configs, only: [:index, :new, :update, :create]
    resources :products
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :products
      end
    end

  end

  get '/shop', to: redirect('/shop/categories')
  namespace :shop do
    resources :categories, only: [:index, :show]
    resources :products, only: [:show]
  end

  namespace :site, path: '/' do

  end

end
