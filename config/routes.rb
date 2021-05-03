Rails.application.routes.draw do
  resources :users, only: %i[index create new]
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'authorized', to: 'sessions#page_requires_login'

end
