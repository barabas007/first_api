Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1, defaults: { format: :json } do
      resources :users, only: %i[show show_user create update]
      post 'login', to: 'login#create'
      get 'users', to: 'users#show'
    end
  end
end
