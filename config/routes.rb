Rails.application.routes.draw do
  resources :posts
  post "posts/new"
  post "posts/show"
  get "posts/show"
  get "posts/new"
  get "posts/_form"
  get "posts/edit"
  get 'pages/home'
  get 'pages/show'
  get 'pages/contact'
  root 'pages#home'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }





end
