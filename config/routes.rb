Rails.application.routes.draw do
  root 'home#index'
  get '/authorize', to: 'auth#gettoken'
  resources :documents
  resources :participations
  resources :estimates
  resources :deliverys
  resources :invoices
end
