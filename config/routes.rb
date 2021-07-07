Rails.application.routes.draw do
  root to: "sessions#new"
  post "/signin" => "sessions#create", as: :sessions
  resources :users, :menu_categories, :menu_items, :carts, :cart_items, :orders, :order_items, :addresses
  get "/user/menu/:id" => "customers#index", as: :users_menu
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/update_menucategory_view/:id" => "menu_categories#update_view", as: :update_category_view
  get "/add_item_view/:id" => "menu_categories#add_item_view", as: :add_item_view
  get "/menuitem_view/:id" => "menu_items#render_items", as: :menu_items_view
  get "/update_menuitem_view/:id" => "menu_items#update_view", as: :update_item_view
  post "/create_menu_category" => "menu_categories#create_category", as: :create_menu_category
  put "/add_quantity/:id" => "cart_items#add_quantity", as: :add_quantity
  put "/reduct_quantity/:id" => "cart_items#reduct_quantity", as: :reduct_quantity
  delete "/delete_all_items" => "cart_items#delete_all", as: :destroy_all_items
  get "/checkout" => "cart_items#checkout", as: :checkout
  put "/update_use_address" => "addresses#update_use_address", as: :update_use_address
  post "/orders" => "orders#create", as: :create_orders
  get "/update_address_view/:id" => "addresses#update_address_view", as: :update_address_view
  get "/customer_orders" => "orders#customer_orders", as: :customer_orders
  put "/cancel_order/:id" => "orders#cancel_order", as: :cancel_order
  put "/update_pending_order" => "orders#update_pending_order", as: :mark_as_delivered
  get "/admin" => "admin#index", as: :admin_index
  get "/reports" => "admin#reports", as: :reports
  get "/users_profile" => "admin#users_profile", as: :users_profile
  get "/update_special_users_view" => "admin#update_special_users_view", as: :update_special_users_view
  patch "/edit_special_users" => "admin#edit_special_users", as: :edit_special_users
  get "/invoices" => "admin#invoices", as: :invoices
  get "/customers_profile_view" => "admin#customers_profile_view", as: :customers_profile_view
  get "/customer_report" => "admin#customer_report", as: :customer_report
  get "/access_control" => "access#access_control", as: :access_control
end
