Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'neighbourhoods#index'

  resources :neighbourhoods, only: [:index, :show] do
    resources :event, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
    resources :assistances do
      resources :comments, only: [:create, :destroy]
    end
    resources :meetings
    resources :notices
  end

  # resources :user, only: [:new, :create] do
  # end

  get :register, to: 'users#new'
  post :register, to: 'users#create'

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  namespace :admin do
    root to: 'dashboard#show'
    resources :users, only: [:edit, :destroy]
    resources :polls, only: [:create, :edit, :destroy]
  end

end
