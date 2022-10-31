Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users
  resources :events, :only => [:show]
  resources :venues, :only => [:show]

  get '/artist/:id/:index' => 'artists#show'
  get '/venue/:id/:index' => 'venues#show'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'


end
