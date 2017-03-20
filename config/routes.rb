Rails.application.routes.draw do
  get 'organisations/index'

  get 'organisations/show'

  get 'organisations/create'

  get 'organisations/destroy'

  get 'organisations/edit'

  get 'organisations/update'

  get 'organisations/new'

  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:edit, :update]
  resources :interviews, only: [:show, :new, :create, :edit, :update]
  resources :organisations, only: [:index, :show, :new, :create, :edit, :update]
end
