Rails.application.routes.draw do
  post 'post/new', to: 'post#create'
  resources :post, only: [:new, :create, :index, :show]
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'user#index'
end
