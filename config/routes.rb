Rails.application.routes.draw do
  # root
  root to: 'home#index'

  resources :home, only: :index
  resources :now_threads, only: :index
  resources :reserve_threads, only: :index
  resources :regular_threads, only: :index

  # Sidekiq root
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['SIDEKIQ_USERNAME'] && password == ENV['SIDEKIQ_PASSWORD']
  end
  mount Sidekiq::Web, at: "/sidekiq"
end
