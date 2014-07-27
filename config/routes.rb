Rails.application.routes.draw do

  devise_scope :user do
    resources :authentications
  end
  get 'welcome/index'

  devise_for :users, controllers: {omniauth_callbacks: 'authentications'}

  root 'welcome#index'

end
