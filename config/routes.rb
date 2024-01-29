Rails.application.routes.draw do
  root 'users#index'

  resources :users, except: [:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up"      => "rails/health#show", as: :rails_health_check
  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in'  => 'sessions#new'
end
