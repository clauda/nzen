Rails.application.routes.draw do
  devise_for :users, 
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" },
    path: 'acesso', path_names: { 
      sign_in: 'login', sign_out: 'sair', sign_up: 'bem-vindo',
      password: 'alterar-senha', confirmation: 'confirmar', edit: 'editar'
    }

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

  resources :services, only: [:create, :edit, :update], path: 'lojas-e-servicos'
  get 'lojas-e-servicos', to: "services#index", as: :all_services
  get 'anuncie', to: "services#new", as: :new_service
  post 'busca', to: "services#search"
  get 'busca', to: "services#index"

  # TODO: refactor this to allow find city by permalink
  get 'natal-rn', to: "home#districts", as: :districts
  get 'natal-rn/:district_id(/:category_id)', to: "home#district", as: :district

  get ':id', to: "services#show", as: :business

  root to: "home#index"
end
