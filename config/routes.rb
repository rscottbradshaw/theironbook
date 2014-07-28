Rails.application.routes.draw do

  resources :students, defaults: {format: :json}

  devise_scope :user do
    resources :authentications, defaults: {format: :json}

  end


  devise_for :users, controllers: {omniauth_callbacks: 'authentications'}
  get 'welcome/index'
  root 'welcome#index'

end
