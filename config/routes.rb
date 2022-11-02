Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users
  resources :events, :only => [:show]
  resources :venues, :only => [:show]
  resources :attendances, :only => [:create, :destroy]
  resources :artists, :only => [:show]

  get '/venue/:id/:index' => 'venues#show'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
