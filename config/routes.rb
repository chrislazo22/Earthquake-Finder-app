Rails.application.routes.draw do
  root to: "static#home"
  post "/earthquakes", to: "static#create"
  get "/earthquakes", to: "static#index"
end
