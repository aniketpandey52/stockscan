Rails.application.routes.draw do
  
  resources :scans, only: [:index, :show]
  resources :variables
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
