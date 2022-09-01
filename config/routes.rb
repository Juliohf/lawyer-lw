Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
 review_lawyer
  resources :users, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end


  patch "restaurants/:id", to: "restaurants#update"

 master
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
