Rails.application.routes.draw do
  devise_for :users
  # get 'static_page/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "static_page#index"

  namespace :admin do
    resources :media_types
    get 'admins/index'
    resources :albums
    resources :artists
    resources :customers
    resources :genres
    resources :playlists
    root "admins#index"
    # resources :
  end
end
