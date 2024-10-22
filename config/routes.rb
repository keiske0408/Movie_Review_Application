Rails.application.routes.draw do
  resources :movies
  get 'home/about'
  root 'home#index'
  devise_for :users
  resources :movies, param: :slug do
    resources :reviews, except: :show
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
