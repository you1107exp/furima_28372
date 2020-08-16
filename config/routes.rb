Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'items#index'
  resources :items, only: :index
  # namespace :users do
  #   resources :registrations, only: [:new, :create]
  #   resources :sessions, only: [:new, :destroy]
  # end
  #post '/', to: 'users/registrations#new'
end

# rails g devise:controllers users
# rails generate devise:controllers users