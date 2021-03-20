Rails.application.routes.draw do
  devise_for :users
  devise_for :stylists, controllers: {
    sessions: 'stylists/sessions',
    passwords: 'stylists/passwords',
    registrations: 'stylists/registrations'
  }
  resources :stylists, only: [:index, :destroy] 
  resources :rooms, only: [:new, :create, :show, :destroy] do
    resources :messages, only: [:index, :create]
  end
  root to: 'diagnoses#index'
end
