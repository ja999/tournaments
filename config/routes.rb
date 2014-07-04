Tournaments::Application.routes.draw do
  devise_for :users
  root 'tournaments#index'

  resources :tournaments do
    member do
      get :subscribe
    end
  end
end
