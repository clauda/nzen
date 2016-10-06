Rails.application.routes.draw do

  devise_for :users, 
    controllers: { 
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks"
    },
    path: 'acesso', path_names: { 
      sign_in: 'login', sign_out: 'sair', sign_up: 'bem-vindo',
      password: 'alterar-senha', confirmation: 'confirmar', edit: 'editar'
    }

  namespace :admin do
    resources :cities
    resources :categories
    resources :districts
    resources :services do
      collection do 
        get 'moderate', to: 'services#moderate', as: :moderate
      end

      member do
        patch 'reject', to: 'services#reject', as: :reject
      end
    end
    resources :issues
    resources :users, only: [:index, :show]

    post 'busca', to: "services#search"
    get 'busca', to: "services#index", as: :search
    root to: "dashboard#index"
  end
  
  get 'painel-de-negocios', to: "account#index", as: :account
  
  get 'termos-de-uso', to: 'statics#terms', as: :terms
  get 'politicas-de-privacidade', to: 'statics#politics', as: :politics
  get 'perguntas-frequentes', to: 'statics#faq', as: :faq
  get 'contato', to: 'statics#contact', as: :contact
  post 'contato', to: 'statics#contact', as: :submit_contact
  patch 'contato', to: 'statics#contact'

  get 'sitemaps', to: 'sitemaps#index'
  get 'sitemaps-companies', to: 'sitemaps#services'
  get 'sitemaps/:id', to: 'sitemaps#district'
  
  get 'remote/categories', to: 'remote#categories'
  get 'remote/districts', to: 'remote#districts'
  post 'remote/services/:id/reportar-erro', to: 'remote#report_error', as: :report_error
  post 'remote/services/:id/like', to: 'remote#like', as: :like
  post 'remote/services/:id/dislike', to: 'remote#dislike', as: :dislike
  post 'remote/services/:id/coment', to: 'remote#add_review_comment', as: :review_comment

  get 'explore', to: "home#categories", as: :categories
  get 'explore/:id', to: "home#category", as: :category

  resources :services, only: [:create, :edit, :update], path: 'lojas-e-servicos'
  get 'lojas-e-servicos', to: "services#index", as: :all_services
  get 'anuncie', to: "services#new", as: :new_service
  post 'busca', to: "services#search"
  get 'busca', to: "services#index", as: :search

  # TODO: refactor this to allow find city by permalink
  get 'natal-rn', to: "home#districts", as: :districts
  get 'natal-rn/:district_id(/:category_id)', to: "home#district", as: :district

  get '/:id', to: "services#show", as: :business

  root to: "home#index"
end
