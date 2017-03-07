Rails.application.routes.draw do
  root 'pages#home'
  devise_for :admins
  devise_for :users

  resources :users do
    resources :applications do
      resources :submissions
      resources :interviews, module: :applications
      resources :offers
    end

    resources :leads do
      resources :invites
      resources :connections
      resources :emails
      resources :meetings
      resources :interviews, module: :leads
      resources :offers
    end

    get '/dashboard' => 'pages#dashboard'
  end

  resources :admins

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :leads
        resources :applications
      end
    end
  end
end
