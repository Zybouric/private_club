Rails.application.routes.draw do
  resources :registrations
  resources :users do 
  	resources :registrations
  end 
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end