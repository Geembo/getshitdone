Todo::Application.routes.draw do
  
  get    'register',  to: 'users#new',          as: 'register'
  get    'login',     to: 'sessions#new',       as: 'login'
  delete 'logout',    to: 'sessions#destroy',   as: 'logout'
  
  resources :sessions
  resources :users
  
  scope 'api' do
    resources :tasks
  end

  root to: 'main#index'
end
