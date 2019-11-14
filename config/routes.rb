Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  # get '/cocktails', to: 'cocktails#index', as: 'cocktails'
  # get '/cocktails/new', to: 'cocktails#new', as: 'new_cocktail'
  # get '/cocktails/:id', to: 'cocktails#show', as: 'cocktail'
  # post 'cocktails', to: 'cocktails#create'

  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [ :new, :create ]
  end
  resources :doses, only: [:destroy]
end
