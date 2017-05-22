Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :dashboards do
    collection do
      get 'ezitor'
    end
  end

  get 'sandbox/icony'
  get 'sandbox/showy'
  get 'sandbox' => 'sandbox#index', :as => 'sandbox'
  get 'index' => 'home#index', :as => 'index'
  root :to => 'home#index'
end
