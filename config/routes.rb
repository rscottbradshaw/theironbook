Rails.application.routes.draw do


  resources :students


  devise_for :users, controllers: {omniauth_callbacks: 'authentications'}
  get 'welcome/index'
  root 'welcome#index'

end
