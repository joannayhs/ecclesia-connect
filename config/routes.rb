Rails.application.routes.draw do
  get 'session/create'
  get 'session/destory'
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
