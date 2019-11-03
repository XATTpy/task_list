Rails.application.routes.draw do
  get 'user/edit'
  get 'user/update'
  get 'user/destroy'
  get '/dashboard', to: 'dashboard#index'

  resources :tasks do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  
  devise_for :users, path_prefix: 'my'
  resources :user
  root to: 'home#index'
end
