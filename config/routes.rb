Rails.application.routes.draw do
  resources :teams
  resources :roles
  resources :users, except: [:new] do  
    resources :roles, only: [:index, :show, :edit]
  end 
  get '/login', to: 'session#new', as: '/login'
  post '/login', to: 'session#create'
  get '/signup', to: 'users#new', as: '/signup'
  get '/auth/facebook/callback', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
