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
  get 'following', to: 'following#index'

  post 'address/cities', to: 'address#cities'

  resources :elections, except: [:destroy]
  resources :managers, except: [:destroy] do
    post 'follow', on: :member
    # post 'follow', as: :follow, action: :follow
    resources :promises, except: [:destroy] do
      get 'finish', shallow: true
      get 'contest', shallow: true
      post 'favorite', on: :member
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
