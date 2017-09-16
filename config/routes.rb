Rails.application.routes.draw do
	resources :products
	resources :categories
	resources :banners
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, except: [:edit, :update, :destroy]
  resources :checkouts, except: [:edit, :update, :destroy], param: :slug

	get 'all-banners', to: 'banners#display'

	root "banners#index"

	get '/about', to: 'pages#about'
	get '/contact', to: 'pages#contact'

  devise_for :users,
  	path: "", 
  	controllers: { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" },
  	path_names: { sign_in: 'login', password: 'forgot', confirmation: 'confirm', unlock: 'unlock', sign_up: 'register', sign_out: 'logout' }

end
