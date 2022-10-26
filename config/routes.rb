Rails.application.routes.draw do
  resources :categories
  resources :contacts
  resources :memberships, only: [:create, :destroy]
  root "categories#index"
end
