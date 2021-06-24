class MenuCategory < ActiveRecord::Base
  validates :name, { presence: true, uniqueness: true }
  validates :status, presence: true
  has_many :menu_items
end
