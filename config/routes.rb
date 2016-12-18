Rails.application.routes.draw do
  get 'home/index'

  # devise_for :user, only: []
  devise_for :users, only: []

  # root :to => 'sample#index'
  root :to => 'home#index'
  resources :sample, only: [:index]
  get '/sample/*other', to: redirect('/sample')


  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resource :users
    resource :customers
    resource :locations
  end
end
