Rails.application.routes.draw do
  resources :login_signups
  resources :splash_screens
  devise_for :users
  resources :users
  resources :groups do
    resources :entities
  end
  resources :group_entities

  root "groups#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
