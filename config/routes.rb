Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'users/new'
  post 'users/create'
  get 'users/:id/edit', to: 'users#edit'
  put 'users/:id', to: 'users#update'
  #delete 'users/:id', to: 'users#destroy'

  post 'friend_requests/:id', to: 'friend_requests#create', as: :create_friend_request

  get 'friends/index'
  get 'friends/destroy'

  resources :friend_requests
  resources :posts do
    resources :comments
  end
  resources :likes
  devise_for :users, :controllers => { registrations: "registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show, :destroy]
	root to: 'static_pages#home'
  get 'static_pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
