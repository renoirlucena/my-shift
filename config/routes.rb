Rails.application.routes.draw do
  get 'exchanges/index'
  get 'exchanges/show'
  get 'exchanges/new'
  get 'exchanges/create'
  get 'exchanges/destroy'
  get 'exchanges/update'
  get 'exchanges/edit'
  get 'requests/index'
  get 'requests/show'
  get 'requests/new'
  get 'requests/create'
  get 'requests/destroy'
  get 'requests/update'
  get 'requests/edit'
  get 'companies/index'
  get 'companies/show'
  get 'companies/new'
  get 'companies/create'
  get 'companies/destroy'
  get 'companies/update'
  get 'companies/edit'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
