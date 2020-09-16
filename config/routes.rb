Rails.application.routes.draw do

  resources :measurements
  # binding.pry

  # get '/', to: "items#about"
  # get '/items', to: "items#index"
  # get '/items/:id', to: "items#show"
  # resources :items, only: [:index, :new]
  resources :items
end
