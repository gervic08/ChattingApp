Rails.application.routes.draw do
  resources :users, except: :new
  get 'signup', to: 'users#new'
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  get 'home', to: 'pages#home'
  mount ActionCable.server, at: '/cable'
end
