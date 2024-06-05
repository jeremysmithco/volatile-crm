Rails.application.routes.draw do
  resources :tabs, only: [:index, :show]
  resources :charts, only: [:index]

  resources :contacts
  resources :companies
  resources :tasks
  resources :messages
  resources :reports
  resources :settings
  resources :searches

  namespace :settings do
    resources :collaborators
    resources :notifications
  end

  get "up" => "rails/health#show", as: :rails_health_check
  root "dashboard#index"
end
