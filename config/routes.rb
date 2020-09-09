Rails.application.routes.draw do

  # binding.pry

  # get '/', to: "items#about"
  # get '/items', to: "items#index"
  # get '/items/:id', to: "items#show"
  # resources :items, only: [:index, :show]
  resources :items
end
