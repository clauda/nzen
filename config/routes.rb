Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :admin do
    resources :categories
    resources :districts
  end
  
  resources :services
  get 'categorias', to: "home#categories", as: :categories
  get 'categorias/:id', to: "home#category", as: :category

  get 'bairros', to: "home#districts", as: :districts
  get 'bairros/:id', to: "home#district", as: :district
  root to: "home#index"
end
