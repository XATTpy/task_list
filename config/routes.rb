Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index'

  resources :tasks do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  
  devise_for :users
  root to: 'home#index'
end
