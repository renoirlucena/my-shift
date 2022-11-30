Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :requests do 
    get "calendar", to: "requests#calendar", on: :member
  end
  resources :exchanges
  resources :companies
end
