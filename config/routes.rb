Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :edit, :update, :destroy] do
    resources :diaries, only: [:new, :create, :edit, :update]
  end
  resources :groups, except: [:show] do
    resources :messages, only: [:new, :create] do
      resources :comments, only: [:new, :create]
    end
  end
end
