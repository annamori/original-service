Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :microposts do
    resource :comments, only: [:create]
  end
  resources :users
  #resources :relationships, only: [:create, :destroy]
end