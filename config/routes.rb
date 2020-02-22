Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Routes for products
  get '/prodcuts' => "dashboard#products"
  post '/create_product' => "dashboard#create_product"
  get '/new_product' => "dashboard#new_product"
end
