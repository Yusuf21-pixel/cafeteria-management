class Address < ActiveRecord::Base
  belongs_to :user
  validates :address, { presence: true, uniqueness: true }
end
