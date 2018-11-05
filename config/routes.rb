Rails.application.routes.draw do
  get '/users/home/', to: 'users#home', as: 'home'
  resources :sessions
  resources :registrations
  resources :users do 
  	resources :registrations
  end 
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
