Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[show show_user create]
      post 'login', to: 'login#create'
    end
  end
end
