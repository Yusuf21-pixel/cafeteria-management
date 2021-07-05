class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, { presence: true, uniqueness: true }
  validates :password, presence: true
  validates :role, presence: true
  has_many :addresses
  has_secure_password
end
