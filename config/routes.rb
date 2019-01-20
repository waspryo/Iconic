Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :pages
  post "posts/new"
  post "posts/show"
  post "posts/comment"
  get "posts/comment"
  get "posts/show"
  get "posts/list"
  get "posts/new"
  get "posts/_form"
  get "posts/edit"

  get 'search' => 'pages#search'

  get 'pages/show'
  get 'pages/contact'
  root 'pages#home'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }








end
