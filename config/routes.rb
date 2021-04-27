Rails.application.routes.draw do
  resources :tickets
  resources :formulas
  resources :details
  resources :products
  resources :parameters
  resources :items
  resources :clients
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #root 'welcome#index'
root 'admin/dashboard#index'
match 'variables/form', via: [:get]
match 'variables/form2', via: [:get]
match 'variables/comment', via: [:get]
match 'reports/vhoja1', via: [:get]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end