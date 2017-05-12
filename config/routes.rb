Rails.application.routes.draw do
  get 'sessions/new'

  resources :users do
  	resources :hosts
  end
  
  get 'hosts' => 'hosts#index'
  get '/signup' => 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
end
