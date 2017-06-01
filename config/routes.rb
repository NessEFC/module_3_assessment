Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  get '/search', to: "search#index"

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]
    end
  end
end
