Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'items#index'
  get 'items', to: 'items#new'
  resources :items
  # namespace :users do
  #   resources :registrations, only: [:new, :create]
  #   resources :sessions, only: [:new, :destroy]
  # end
  #post '/', to: 'users/registrations#new'
end

# rails g devise:controllers users
# rails generate devise:controllers users