Rails.application.routes.draw do
  
  resources :favorites
  	#resources :reviews
	root "movies#index"

	resources :movies do
		resources :reviews
	end
  	
	resources :users
  	get 'signup' => 'users#new'

  	resource :session
  	get "signin" => "sessions#new"
end
