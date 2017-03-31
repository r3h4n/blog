Rails.application.routes.draw do
  get 'items/index'

  get 'welcome/index'
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]


  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
  
  root 'tutorials#index'
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  mount ActionCable.server => '/cable'
  get '/chat', to: 'chatrooms#show'
  
  resources :messages, only: [:create]
  
  resources :items
  
  resources :tutorials do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end