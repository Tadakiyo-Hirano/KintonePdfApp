Rails.application.routes.draw do
  root 'home#index'
  get '/authorize', to: 'auth#gettoken'
  resources :documents, only: %i(index show)
  resources :participations, only: %i(show)
  resources :estimates, only: %i(show)
  resources :deliverys, only: %i(show)
  resources :invoices, only: %i(show)
end
