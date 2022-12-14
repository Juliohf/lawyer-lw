Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    resources :chatrooms, only: :create
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  get "/profile", to: "profiles#show"
  resources :lawyer_tags, only: [:new, :create, :destroy]
  resources :lawyer_categories, only: [:new, :create, :destroy]

  patch "restaurants/:id", to: "restaurants#update"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
