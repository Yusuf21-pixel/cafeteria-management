class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :address, presence: true
  validates :phone_no, presence: true
  validates :role, presence: true

  has_secure_password
end
