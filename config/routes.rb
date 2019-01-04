Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'pages/home'
  get 'pages/contact'
  root 'pages#home'

end
