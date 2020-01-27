Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :diaries, except: [:index]
  end
  resources :groups, except: [:index, :show] do
    resources :messages, only: [:index, :create]
  end
end
