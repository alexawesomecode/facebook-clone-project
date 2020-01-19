Rails.application.routes.draw do
  get  'posts/new'
  get  'posts/create'
  get  'posts/index'
  get  'posts/show'
  root 'posts#index'
  get  '/help',          to:   'static_pages#help'
  get  '/about',         to:   'static_pages#about'
  get  '/contact',       to:   'static_pages#contact'
  post 'posts/new',      to:   'posts#create'
  resources  :posts,     only: [:new, :create, :index, :show]
  resources  :user,      only: [:show, :index]
  resources  :postlikes, only: [:new, :create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
