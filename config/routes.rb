Rails.application.routes.draw do

  get 'authentications/index'

  get 'authentications/all'

  get 'authentications/destroy'

  get 'welcome/index'

  devise_for :users

  root 'welcome#index'

end
