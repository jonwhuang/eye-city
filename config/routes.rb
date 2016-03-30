Rails.application.routes.draw do
  root 'returns#home'

  devise_for :admins, :skip => [:registrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end

  resources :manufacturers
  resources :brands do
    resources :returns, shallow: true
  end

  get '/home' => 'returns#home'
end
