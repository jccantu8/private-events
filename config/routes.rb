Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :invitations
  resources :events, only: [:index, :create, :new, :show]
  resources :users, only: [:create, :new, :show]
end
