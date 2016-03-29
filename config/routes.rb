Rails.application.routes.draw do
  root 'returns#index'

  devise_for :admins

  resources :manufacturers
  resources :brands do
    resources :returns, only: [:index, :new, :create]
  end

  resources :returns, only: [:index, :show, :update, :destroy]


end
