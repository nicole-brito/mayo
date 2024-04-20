Rails.application.routes.draw do
  devise_for :users

  root "articles#index"

  post '/' => 'articles#create'

  resources :articles do
    resources :comments
  end

  devise_for :users, controllers: { registrations: 'registrations' }



end
