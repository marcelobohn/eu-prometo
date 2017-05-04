Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/index'

  get 'about', to: 'about#index'
  get 'contact', to: 'contact#index'

  resources :elections
  resources :managers do
    resources :promises
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
