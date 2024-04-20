Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup',
    password: 'forgot',
    confirmation: 'confirm',
    edit: 'edit'
  },
             controllers: {
    sessions: 'users/sessions',
    registrations: 'registrations',
    passwords: 'devise/passwords'
  }

  root "articles#index"

  resources :articles do
    resources :comments
  end

end
