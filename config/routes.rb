Rails.application.routes.draw do

  devise_for :admins
  namespace :staff do
    root 'dashboard#index'
    # resources :categories
    # resources :dashboard, only: [:index]
  end

end
