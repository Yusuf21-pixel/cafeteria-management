class User < ActiveRecord::Base
  has_many :menu_items
end
