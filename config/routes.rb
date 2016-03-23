Rails.application.routes.draw do

  namespace :staff do
    root 'dashboard#index'
    # resources :dashboard, only: [:index]
  end

end
