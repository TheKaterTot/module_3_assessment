Rails.application.routes.draw do
  root 'items#index'
  get '/search', to: "stores#index", as: "search"

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
