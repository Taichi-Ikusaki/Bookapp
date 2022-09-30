Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  root to: 'users#show'
  get 'signup', to: 'users#show'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
