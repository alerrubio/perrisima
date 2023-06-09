Rails.application.routes.draw do
  resources :users
  resources :categories
  resources :clients
  resources :incomes
  resources :outcomes
  resources :profits
  #get "/categories", to: "categories#index"

  post "/users/login", to: "users#login"

  get "/clients/search/:phone", to: "clients#search"

  post "/profits/search", to: "profits#byFilters"

  #get "/categories/:id", to: "categories#show"
  #post "/categories", to: "categories#create"
  #patch "/categories/:id", to: "categories#update"
  #delete "/categories/:id", to: "categories#destroy"
  #get "/clients", to: "clients#index"
  #get "/clients/:id", to: "clients#show"
  #post "/clients", to: "clients#create"
  #get "/incomes", to: "incomes#index"
  #get "/incomes/:id", to: "incomes#show"
  #post "/incomes", to: "incomes#create"
  
end
