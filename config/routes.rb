Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations' }

  root 'home#index'
  get 'home/index'
  get 'cities', to: 'home#cities'
  get 'states', to: 'home#states'
  get 'countries', to: 'home#countries'
  get 'about', to: 'about#index'
  get 'contact', to: 'contact#index'
  get 'support', to: 'support#index'

  post 'address/cities', to: 'address#cities'

  resources :elections, except: [:destroy]
  resources :managers do
    resources :promises do
      get 'finish', shallow: true
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
