Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users
  resources :events, :only => [:show] do
    resources :comments, only: [:create, :destroy]
  end
  resources :attendances, :only => [:create, :destroy]
  resources :artists, :only => [:show]

  get '/venue/:id/:index' => 'venues#show'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
