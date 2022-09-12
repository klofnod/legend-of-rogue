Rails.application.routes.draw do
  
  get 'sessions/create'
  get 'sessions/destroy'
  resources :current_rounds
  resources :chests
  resources :enemies
  resources :games
  resources :encounters
  resources :characters
  resources :combatants
  resources :gears
  post "/login", to: "sessions#create"
  get  "/userInSession", to:"sessions#logged_in_user"
  delete "/logout", to:"sessions#destroy"
  get "/alive", to:"combatants#alive"
  get "/dead", to:"combatants#dead"
  post "/nextTurn", to:"current_rounds#nextTurn"
  post "/flee", to:"current_rounds#flee"
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
