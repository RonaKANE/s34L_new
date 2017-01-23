Rails.application.routes.draw do
  resources :users do
  	resources :hosts
  end
  
  get 'hosts' => 'hosts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
