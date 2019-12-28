Rails.application.routes.draw do
  # root
  root to: 'home#index'

  resources :home, only: :index
end
