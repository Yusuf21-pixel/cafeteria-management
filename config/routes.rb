Rails.application.routes.draw do
  root to: "sessions#new"
  resources :users
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
