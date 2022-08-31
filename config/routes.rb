Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:index, :show]

  patch "restaurants/:id", to: "restaurants#update"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
