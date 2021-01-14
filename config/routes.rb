Rails.application.routes.draw do
  root 'home#index'
  get '/authorize', to: 'auth#gettoken'
  # get '/documents', to: 'documents#new'
  resources :documents
  resources :participations
  resources :estimates
  resources :deliverys
end
