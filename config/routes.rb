Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'neighbourhoods#index'

  resources :neighbourhoods, only: [:index, :show] do
    resources :events, except: [:index] do
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
    root to: 'dashboard#index'
    resources :users, only: [:edit, :destroy]
    resources :polls, only: [:create, :edit, :destroy]
    resources :units, only: [:update]
  end

end
