def method_user
  post 'login', to: 'login#create'
  get 'users', to: 'users#show'
  put 'users', to: 'users#edit'
  delete 'users', to: 'users#destroy'
  get 'users', to: 'users#show_user'
  post 'users', to: 'users#login'
  get 'users', to: 'users#index'
  put 'users', to: 'user#edit'

  resources :users, only: %i[show show_user create edit login index]
end

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1, defaults: { format: :json }, &method(:method_user)
  end
end
