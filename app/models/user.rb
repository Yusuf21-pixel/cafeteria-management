class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :role, presence: true
  has_many :addresses
  has_many :orders
  has_secure_password

  def self.owners_and_clerks()
    all.where("role = ? OR role = ?", "clerk", "owner")
  end
end
