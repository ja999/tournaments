Tournaments::Application.routes.draw do
  devise_for :users
  root 'tournaments#index'

  resources :tournaments
end
