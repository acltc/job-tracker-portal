Rails.application.routes.draw do
  get '/' => 'pages#home'
  resources :leads
  resources :invites
  resources :connections
  resources :emails
  resources :meetings
  resources :interviews
  resources :offers
end
