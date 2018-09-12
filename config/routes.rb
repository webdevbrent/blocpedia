Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  resources :wikis
  devise_for :users
  post 'downgrade_account' => 'users#downgrade_account'
  root to: 'home#index'
end
