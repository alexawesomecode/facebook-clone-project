Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  get 'posts/show'
  post 'posts/new', to: 'posts#create'
  resources  :posts, only: [:new, :create, :index, :show]
  resources  :user, only: [:show]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'user#index'
end
