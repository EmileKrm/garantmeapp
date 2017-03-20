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
  resources :users, only: [:edit, :update] do
    resources :interviews, only: [:show, :new, :create, :edit, :update]
  end
  resources :organisations, only: [:index, :show, :new, :create, :edit, :update]
end
