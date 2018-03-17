Rails.application.routes.draw do
  
  
  resources :genres
  	#resources :reviews
	root "movies#index"

	resources :movies do
		resources :reviews
    resources :favorites
	end
  	
	resources :users
  	get 'signup' => 'users#new'

  	resource :session
  	get "signin" => "sessions#new"
end
