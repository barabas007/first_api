Rails.application.routes.draw do

  namespace :api  do
    namespace :v1 do # , &method(:method_user)
      resources :users, only: %i[show show_user create edit login index destroy]
      post 'users', to: '/api/v1/users#login'
      get 'users', to: '/api/v1/users#show_user'
      put 'users', to: '/api/v1/users#edit'
    end
  end
end
