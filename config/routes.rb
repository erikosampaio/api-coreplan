Rails.application.routes.draw do
  resources :pedidos, except: [:destroy, :update, :index, :create]

  get '/pedidos', to: 'pedidos#index'

  post '/monte_seu_computador', to: 'pedidos#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
