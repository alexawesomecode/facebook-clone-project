Rails.application.routes.draw do
  get  'posts/new'
  get  'posts/create'
  get  'posts/index'
  get  'posts/show'
  get  'postlikes/create'
  get  'postlikes/new'
  root 'posts#index'
  post 'posts/new',      to:   'posts#create'
  post 'postlikes/new',  to:   'postlikes#create'
  resources  :posts,     only: [:new, :create, :index, :show]
  resources  :user,      only: [:show, :index]
  resources  :postlikes, only: [:new, :create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
