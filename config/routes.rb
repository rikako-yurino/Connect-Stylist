Rails.application.routes.draw do
  devise_for :users
  root to: 'diagnoses#index'
  resources :rooms, only: [:new, :create, :show]
end
