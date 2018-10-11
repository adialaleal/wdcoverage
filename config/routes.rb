Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
root to: 'toners#index'
	devise_scope :users do
		get "login", to: 'devise/sessions#new'
	end

  devise_for :users


  resources :toners
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
