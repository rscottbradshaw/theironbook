Rails.application.routes.draw do

  get 'info/create'

  get 'info/show'

  get 'info/destroy'

  devise_scope :user do
    resources :authentications, defaults: {format: :json}

  end
  get 'welcome/index'

  devise_for :users, controllers: {omniauth_callbacks: 'authentications'}

  root 'welcome#index'

end
