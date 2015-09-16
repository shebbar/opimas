Rails.application.routes.draw do
  resources :reports
  resources :employees
  resources :roles
  resources :companies
  resources :categories
  resources :categories
  resources :categories
  root 'static_pages#home'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :categories
end
