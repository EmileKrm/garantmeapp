Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:edit, :update]
  resources :interviews, only: [:show, :new, :create, :edit, :update, :found_apartment]
  post 'interviews/:id/found_apartment', to: 'interviews#found_apartment'

  get 'team', to: 'pages#team'
  get 'contact', to: 'pages#contact'


  resources :organisations, only: [:index, :show, :new, :create, :edit, :update]
  mount Attachinary::Engine => "/attachinary"

end
