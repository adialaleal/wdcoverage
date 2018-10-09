Rails.application.routes.draw do
	root to: 'toners#index'
  resources :toners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
