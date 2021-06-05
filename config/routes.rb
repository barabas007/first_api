Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do # , &method(:method_user)
      resources :users, only: %i[ show create update login index destroy]
      post 'users/login', to: '/api/v1/users#login'
      delete'users', to: '/api/v1/users#destroy'
    end
  end
end
