Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'vehicles#index', as: :authenticated_root
  end
  root 'vehicles#index'
  
  resources :vehicles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
