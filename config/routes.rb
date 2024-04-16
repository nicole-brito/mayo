Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments
  end

  get 'signup', to: 'users#new' 
  resources :users 

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' 


end
