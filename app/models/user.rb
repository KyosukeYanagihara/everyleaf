class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { in: 1..30 }
  validates :email, presence: true,  length: { in: 1..255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true,  length: { in: 8..16 }
  before_validation { email.downcase! }
end
