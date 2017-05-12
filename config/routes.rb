Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations' }

  root 'home#index'
  get 'home/index'

  get 'about', to: 'about#index'
  get 'contact', to: 'contact#index'
  get 'support', to: 'support#index'

  resources :elections
  resources :managers do
    resources :promises do
      get 'finish', shallow: true
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
