Rails.application.routes.draw do
  resources :categories do
    member do
      get :contacts
    end
  end
  resources :contacts
  resources :memberships, only: [:create, :destroy]
  root "categories#index"
end
