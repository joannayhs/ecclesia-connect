Rails.application.routes.draw do
  post '/assignrole', to: 'user_roles#create'
  resources :teams  do 
    resources :roles, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end  

  resources :roles
  resources :users, except: [:new] do  
    resources :roles, only: [:index, :show, :edit, :update, :destroy]
    delete 'unassignrole', to: 'user_roles#destroy'
    patch '/confirmrole', to: 'user_roles#update', as: '/confirmrole'
  end 

  get '/login', to: 'session#new', as: '/login'
  post '/login', to: 'session#create'
  get '/signup', to: 'users#new', as: '/signup'
  get '/auth/facebook/callback', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get '/profile', to: 'users#profile', as: '/profile'
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
