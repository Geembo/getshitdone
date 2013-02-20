Todo::Application.routes.draw do

  root to: 'main#index'
    
  get    'register',  to: 'users#new',          as: 'register'
  get    'login',     to: 'sessions#new',       as: 'login'
  get 'logout',    to: 'sessions#destroy',   as: 'logout'
  
  resources :sessions
  resources :users
  
  scope 'api' do
    resources :tasks
  end

end
