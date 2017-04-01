Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'neighbourhoods#index'

  resources :neighbourhoods, only: [:index] do
    resources :events, except: [:index]
    resources :assistances
    resources :meetings, except: [:edit] do
      resources :videos, only: [:create, :destroy]
      resources :documents, only: [:create, :destroy, :show]
    end
    resources :notices
    resources :polls, only: [:update]
  end

  resources :events, only: [] do
    resources :comments, only: [:create, :update, :destroy]
  end

  resources :assistances, only: [] do
    resources :comments, only: [:create, :update, :destroy]
  end


  # resources :user, only: [:new, :create] do
  # end
  get :neighbourhood, to: 'neighbourhoods#show'
  get :register, to: 'users#new'
  post :register, to: 'users#create'

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  namespace :admin do
    root to: 'dashboard#index'
    post :alert, to: 'dashboard#alert'
    post :chat, to:'dashboard#chat'
    get :search, to:'dashboard#search'
    post :create_poll, to: 'dashboard#create_poll'
    get :show_polls, to: 'dashboard#show_polls'

  end

end
