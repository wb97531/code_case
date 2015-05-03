Rails.application.routes.draw do
  # default_url_options host: 'loaclhost', port: 3000
  default_url_options host: 'https://code-case.herokuapp.com/', port: $PORT

  resources :courses

  resources :snippets

  resources :coders

  resources :projects

  resources :verifications

  root 'sessions#login'
  get 'dashboard/:id',            to: 'dashboards#dashboard',                  as: 'dashboard'
  get 'verification/:token',      to: 'coders#verify',                         as: 'verify_email'
  get 'login',                    to: 'sessions#login',                        as: 'get_login'
  post 'login',                   to: 'sessions#create',                       as: 'login'
  delete 'logout',                to: 'sessions#destroy',                      as: 'logout'
  get 'guest',                    to: 'sessions#guest',                        as: 'guest'
  post 'view_coder',              to: 'sessions#view_coder',                   as: 'view_coder'
  get 'email_coder',              to: 'dashboards#email_form'
  post 'send_coder_email',        to: 'dashboards#send_coder_email'
  get 'add_phone',                to: 'sms_text_messages#add_phone'
  post 'update_coders_phone/:id', to: 'sms_text_messages#update_coders_phone', as: 'update_coders_phone'
end
