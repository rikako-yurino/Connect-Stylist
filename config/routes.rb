Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get '/show_additionally', to: 'rooms#show_additionally'
  devise_for :users
  devise_for :stylists, controllers: {
    sessions: 'stylists/sessions',
    passwords: 'stylists/passwords',
    registrations: 'stylists/registrations'
  }

  post 'reservations/confirm' => 'reservations#confirm'
  resources :reservations, only: [:new, :create, :show] do
    resources :rooms, only: [:new, :create, :show, :destroy, :list_stylist, :change] 
      resources :messages, only: [:create]
  end
  resources :stylists, only: [:index, :destroy, :edit] 
  resources :diagnoses, only: [:index, :new, :show] 

  root to: 'diagnoses#index'
end
