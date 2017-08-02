Rails.application.routes.draw do

  root 'properties#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get  '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/signup',  to: 'users#create'
  #get '/admin/profile', to: 'admin#show'
  #get '/view/:id', to: 'properties#view'
  resources :properties
  resources :properties do
    get 'view'
  end
  resources :users, :admins do
    resources :properties
  end
  resources :admins do
    resources :users
  end
  #get '/admin', to: 'admin#index'
  #resources :admins
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
