Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users
  resources :events, :only => [:show, :edit, :update]
  
  get '/artist/:id/:index' => 'artists#show'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'


end
