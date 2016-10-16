Rails.application.routes.draw do
  root 'users#new'
  resources :users,     only: [:new, :create, :show]
  resources :events,     only: [:new, :create, :show, :index]
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
