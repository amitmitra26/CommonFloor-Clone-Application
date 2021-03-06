Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get 'auth/:provider/callback', to: 'sessions#omni'
  get  '/signup',  to: 'users#new'
  get  '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/signup',  to: 'users#create'
  get '/admin/AllProperties', to: 'properties#adminUser'
  get '/search', to: 'static_pages#search'
  resources :users, :admins do
    resources :properties, :reviews
  end

  resources :properties do
    resources :reviews, :favourites
  end
  resources :admins do
    resources :users
    get :reviews, to: 'reviews#index'
  end
  resources :reviews do
    get 'approval'
    patch 'approve'
    get 'userReview', on: :collection
  end
  resources :reviews, :properties, :favourites
    
end
