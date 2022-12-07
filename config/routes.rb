Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :requests do
    get "calendar", to: "requests#calendar", on: :member
    resources :exchanges, only: %i[new create]
  end
  resources :exchanges, except: %i[new create]
  resources :companies
  resources :orders, only: [:show, :create]
  resources :memberships, only: [:show]
end
