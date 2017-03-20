Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:edit, :update] do
    resources :interviews, only: [:show, :new, :create, :edit, :update]
  end
  resources :organisations, only: [:index, :show, :new, :create, :edit, :update]
end
