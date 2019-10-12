Rails.application.routes.draw do
  resources :roles
  resources :users
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/auth/facebook/callback', to: 'session#create'
  post '/logout', to: 'session#destroy'
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
