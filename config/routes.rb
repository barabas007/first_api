Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1, defaults: { format: :json } do
      post 'login', to: 'login#create'
      get 'users', to: 'users#show'
      put 'users', to: 'users#edit'
      delete 'users', to: 'users#destroy'
      get 'users', to: 'users#show_user'
      resources :users, only: %i[show show_user create edit]
    end
  end
end
