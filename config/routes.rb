Rails.application.routes.draw do
  devise_for :users
  devise_for :stylists, controllers: {
    sessions: 'stylists/sessions',
    passwords: 'stylists/passwords',
    registrations: 'stylists/registrations'
  }
  root to: 'diagnoses#index'
  resources :rooms, only: [:new, :create, :show, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :stylists, only: [:index, :destroy] 
end
