Rails.application.routes.draw do
  resources :wikis do
       resources :collaborators, only: [:new, :create, :destroy]
  end
  
  resources :charges, only: [:new, :create]
  devise_for :users
  post 'downgrade_account' => 'users#downgrade_account'
  root to: 'home#index'
end
