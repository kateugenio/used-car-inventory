Rails.application.routes.draw do
  root 'dashboard#home'
  get 'dashboard/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
