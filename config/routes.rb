Rails.application.routes.draw do
  resources :courses

  resources :snippets

  resources :coders

  resources :projects

  root 'sessions#login'
  get 'dashboard/:id', to: 'dashboards#dashboard', as: 'dashboard'
  get '/login', to: 'sessions#login', as: 'get_login'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy'
  get '/guest', to: 'sessions#guest', as: 'guest'
  post '/view_coder', to: 'sessions#view_coder', as: 'view_coder'
  get 'send_coder_email', to: 'dashboards#send_coder_email'
end
