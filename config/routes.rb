Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :diaries
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
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end

end
