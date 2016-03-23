Rails.application.routes.draw do

  devise_for :admins
  namespace :staff do
    root 'dashboard#index'
    # resources :dashboard, only: [:index]
  end

end
