Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :diaries
    # resources :diaries, except: [:index]
  end
  namespace :groups do
    resources :searches, only: [:index] do
      collection do
        get 'search'
      end
    end
  end
  resources :groups, except: [:index, :show] do
  member do
    post 'join'
  end
    resources :messages, only: [:index, :create]
    resources :events, only: [:index]
  end
end