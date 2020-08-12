Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'items#index'
  resources :items, only: :index
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :destroy]
end
