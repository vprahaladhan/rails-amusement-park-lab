Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#index"
  resources :users, :sessions, :attractions
  get '/signin', to: "sessions#new"
  get '/logout', to: "sessions#destroy"
  post '/go-on-ride', to: "rides#go_on_ride", as: 'go_on_ride'
end
