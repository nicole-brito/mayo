Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup' },
             controllers: {
    sessions: 'users/sessions',
    registrations: 'registrations',
  }

  root "articles#index"

  resources :articles do
    resources :comments
  end

end
