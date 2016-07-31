Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :admin do
    resources :cities
    resources :categories
    resources :districts
    resources :services
  end
  
  get 'sitemaps', to: 'sitemaps#index'
  get 'sitemaps-companies', to: 'sitemaps#services'
  get 'sitemaps/:id', to: 'sitemaps#district'

  get 'explore', to: "home#categories", as: :categories
  get 'explore/:id', to: "home#category", as: :category

  get 'natal-rn', to: "home#districts", as: :districts
  get 'natal-rn/:district_id(/:category_id)', to: "home#district", as: :district

  get 'lojas-e-servicos', to: "services#index", as: :services
  get 'anuncie', to: "services#new", as: :new_service
  post 'busca', to: "services#search"
  get 'busca', to: "services#index"
  resources :services, only: [:create,:edit,:update]

  get ':id', to: "services#show", as: :business

  root to: "home#index"
end
