Rails.application.routes.draw do
  # get "users/index"
  root "home#index"

  mount V1::Base => '/'

  # namespace :api do
  #   namespace :v1 do
  #     resources :users
  #   end
  # end


  get 'sign_up', to: 'users#new', as: :sign_up
  post 'sign_up', to: 'users#create'
  get 'login' , to: 'sessions#new', as: :login
  post 'login' , to: 'sessions#create' 
  delete 'logout', to: 'sessions#destroy', as: :logout
  # with "resources" we dont need to write get "users/index", "users/new" etc. just writing resources will map all the actions created in the user controller
  resources :posts, :comments

  # get "users/Abc"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # post "/new", redirect_to "users/index"
  # Defines the root path route ("/")
  
end
