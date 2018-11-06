Rails.application.routes.draw do
  get '/users/home/', to: 'users#home', as: 'home'
  get '/sessions/new', to: 'sessions#new'
  post '/sessions/new', to: 'sessions#create'
  resources :sessions
  resources :registrations
  resources :users do 
  	resources :registrations
  end 
end
