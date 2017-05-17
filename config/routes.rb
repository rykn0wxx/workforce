Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  get 'sandbox' => 'sandbox#index', :as => 'sandbox'
  get 'index' => 'home#index', :as => 'index'
  root :to => 'home#index'
end
