Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "home#index"

  devise_for :users, controllers: { registrations: 'users/registrations' , sessions: 'users/sessions' }

   get 'verify_phone', to: 'users/phone_verifications#new', as: :verify_phone
   post 'verify_phone', to: 'users/phone_verifications#verify'
   get 'resend_code', to: 'users/phone_verifications#resend_code', as: 'resend_code'
   get 'marketplace', to: 'home#marketplace'

  resources :tractor_listings do
    resources :tractors
  end
  resources :sellers
  resources :push_subscriptions
  resources :tractors, only: [:index, :show]
  resources :dealers
  resources :locations
end
