Rails.application.routes.draw do
  root to: "sessions#new"

  resources :users, :menu_categories, :menu_items

  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/update_menucategory_view/:id" => "menu_categories#update_view", as: :update_category_view
  get "/add_item_view/:id" => "menu_categories#add_item_view", as: :add_item_view
  get "/menuitem_view/:id" => "menu_items#render_items", as: :menu_items_view
  get "/update_menuitem_view/:id" => "menu_items#update_view", as: :update_item_view
  post "/create_menu_category" => "menu_categories#create_category", as: :create_menu_category
end
