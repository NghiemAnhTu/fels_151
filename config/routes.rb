Rails.application.routes.draw do

  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    get "history", on: :member
  end

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :test_details, only: :show
  resources :user_tests, only: :show
  resources :courses
  resources :lessons

  namespace :admin do
    root "admins#index"
    resources :courses
    resources :lessons
    resources :questions
    resources :users
    resources :words
  end
end
