Rails.application.routes.draw do
  root 'items#index'
  post '/search', to: "stores#index", as: "search"

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace "api" do
    namespace "v1" do
      resources :items, only: [:index, :show, :create, :destroy]
    end
  end
end
