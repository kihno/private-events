Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :guests, only: [:index, :update]
  end
  resources :profiles
  resources :event_invites, only: [:create, :destroy]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
