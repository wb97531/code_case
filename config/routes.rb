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
  get 'email_coder', to: 'dashboards#email_form'
  post 'send_coder_email', to: 'dashboards#send_coder_email'
  get 'add_phone', to: 'text_messages#add_phone'
  post 'update_coders_phone/:id', to: 'text_messages#update_coders_phone', as: 'update_coders_phone'
end
