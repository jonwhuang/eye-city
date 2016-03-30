Rails.application.routes.draw do
  root 'returns#home'

  devise_for :admins

  resources :manufacturers
  resources :brands do
    resources :returns, shallow: true
  end

  get '/home' => 'returns#home'
end
