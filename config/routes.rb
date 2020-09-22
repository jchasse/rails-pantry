Rails.application.routes.draw do



  resources :users do
    resources :items
  end

  resources :items do
    resources :measurements
  end

  resources :measurements

  # get '/', to: "items#about"
  # get '/items', to: "items#index"
  # get '/items/:id', to: "items#show"
  # resources :items, only: [:index, :new]

end
