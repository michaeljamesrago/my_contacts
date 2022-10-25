Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/show'
  resources :categories
  resources :contacts
  root "categories#index"
end
