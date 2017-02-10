Rails.application.routes.draw do
  root 'pages#home'
  devise_for :admins
  devise_for :users

  resources :users do
    resources :leads
    resources :invites
    resources :connections
    resources :emails
    resources :meetings
    resources :interviews
    resources :offers
  end

  resources :admins

namespace :api do
  namespace :v1 do
    resources :users do
      resources :leads
    end
  end
end
  
end
