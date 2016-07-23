Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :admin do
    resources :categories
    resources :districts
    resources :services
  end
  
  get 'categorias', to: "home#categories", as: :categories
  get 'categorias/:id', to: "home#category", as: :category

  get 'bairros', to: "home#districts", as: :districts
  get 'bairros/:id', to: "home#district", as: :district

  get 'lojas-e-servicos', to: "services#index", as: :services
  get 'anuncie', to: "services#new", as: :new_service
  resources :services, only: [:create,:edit,:update]

  get ':id', to: "services#show", as: :business

  root to: "home#index"
end
