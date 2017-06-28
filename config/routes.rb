Rails.application.routes.draw do

  #attachinary setup
  mount Attachinary::Engine => "/attachinary"



  get 'leads/new'

  get 'leads/create'

  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations" }
  root to: 'pages#home'

  get 'messages/:id/create', to: 'messages#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # routes for leads
  resources :leads, only: [:new, :create, :show]

  #routes for users
  resources :users, only: [:edit, :update]



  #routes for interviews
  resources :interviews, only: [:show, :new, :create, :edit, :update, :found_apartment]

  post 'interviews/:id/found_apartment', to: 'interviews#found_apartment'
  get 'interviews/:id/edit_later', to: 'interviews#edit_later', as: :edit_later
  post 'interviews/:id/create_pdf', to: 'interviews#create_pdf', as: :create_pdf
  post 'interviews/:id', to: 'users#update_later', as: :update_user

  #routes for content pages: team, contact
  get 'team', to: 'pages#team'
  get 'contact', to: 'pages#contact'

  #routes for organisations
  resources :organisations, only: [:index, :show, :new, :create, :edit, :update]

end
