def method_user
  post 'login', to: 'login#create'
  get 'users', to: '/api/v1/users#show'
  put 'users', to: '/api/v1/users#edit'
  delete 'users', to: '/api/v1/users#destroy'
  get 'users', to: '/api/v1/users#show_user'
  post 'users', to: '/api/v1/users#login'
  get 'users', to: '/api/v1/users#index'
  put 'users', to: '/api/v1/user#edit'
  post 'users', to: '/api/v1/users#create'

  resources :users, only: %i[show show_user create edit login index]
end

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1, defaults: { format: :json }, &method(:method_user)
  end
end
