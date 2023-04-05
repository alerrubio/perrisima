Rails.application.routes.draw do
  resources :users

  resources :categories
  #get "/categories", to: "categories#index"
  #get "/categories/:id", to: "categories#show"
  #post "/categories", to: "categories#create"
  #patch "/categories/:id", to: "categories#update"
  #delete "/categories/:id", to: "categories#destroy"
end
