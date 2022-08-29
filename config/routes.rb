Rails.application.routes.draw do
  resources :appointments
  resources :appointment_constraint
  get 'home/index'
  devise_for :users

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
