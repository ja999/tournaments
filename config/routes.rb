Tournaments::Application.routes.draw do
  devise_for :users
  root 'high_voltage/pages#show', id: 'main'

end
