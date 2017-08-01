Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get  '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/signup',  to: 'users#create'
  #get '/admin/profile', to: 'admin#show'
  resources :users, :admins do
    resources :properties
  end
  #get '/admin', to: 'admin#index'
  #resources :admins
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
