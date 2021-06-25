class MenuItem < ActiveRecord::Base
  validates :name, { presence: true, uniqueness: true }
  validates :price, presence: true
  validates :status, presence: true
  belongs_to :menu_category
end
