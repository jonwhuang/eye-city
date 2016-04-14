Rails.application.routes.draw do
  root 'returns#index'

  devise_for :admins, :skip => [:registrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end

  resources :manufacturers
  resources :brands
  resources :returns

  get '/reset_password' => 'admin#reset'
  get '/collection' => 'manufacturers#collection'
  get '/filter' => 'returns#filter'
end
