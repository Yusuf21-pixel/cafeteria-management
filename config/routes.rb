Rails.application.routes.draw do
  root to: "sessions#new"

  resources :users, :menu_categories, :menu_items

  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/update_menucategory_view/:id" => "menu_categories#update_view", as: :update_category_view
  get "/add_item_view/:id" => "menu_categories#add_item_view", as: :add_item_view
end
