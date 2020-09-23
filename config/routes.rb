Rails.application.routes.draw do



  resources :users do
    resources :items
  end

  resources :items do
    resources :measurements
  end

  resources :measurements

  get '/signup', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/facebook/callback", to: "sessions#create_with_fb"
  root 'users#home'



  # get '/', to: "items#about"
  # get '/items', to: "items#index"
  # get '/items/:id', to: "items#show"
  # resources :items, only: [:index, :new]

end
