Rails.application.routes.draw do
  root'page#home'
  get 'about', to: 'page#about'
  resources :articles
  
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :users, except: [:new]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
