Rails.application.routes.draw do

  resources :categories
  devise_for :admins
  namespace :staff do
    root 'dashboard#index'
    # resources :dashboard, only: [:index]
  end

end
