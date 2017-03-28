Rails.application.routes.draw do

	mount ActionCable.server, at: '/cable'
  
devise_for :users

root to: "home#index"

get "/users/:id", to: "users#show", :as => :user

resources :conversations, only: [:create] do
	member do 
		post :close
	end
	resources :messages, only: [:create]
end
end
