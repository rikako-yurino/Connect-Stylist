Rails.application.routes.draw do
  devise_for :users
  devise_for :stylists, controllers: {
    sessions: 'stylists/sessions',
    passwords: 'stylists/passwords',
    registrations: 'stylists/registrations'
  }
  resources :rooms, only: [:new, :create, :show, :destroy] do
    resources :messages, only: [:create]
  end
  resources :stylists, only: [:index, :destroy] 
  resources :diagnoses, only: [:index, :new, :show] 
  root to: 'diagnoses#index'
end
