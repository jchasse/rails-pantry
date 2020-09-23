class User < ApplicationRecord
  has_many :measurements
  has_many :items, through: :measurements
  validates_presence_of :username
  validates_uniqueness_of :username
  has_secure_password
end
