Rails.application.routes.draw do

  devise_for :admins
  namespace :staff do
    root 'root#index'

    resources :categories
    # resources :dashboard, only: [:index]
  end

  namespace :shop do
    resources :categories, only: [:index, :show]
  end

  get '/shop', to: redirect('/shop/categories')

end
