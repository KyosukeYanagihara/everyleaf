class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { in: 1..30 }
  validates :email, presence: true,  length: { in: 1..255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true,  length: { in: 8..16 }
  before_validation { email.downcase! }
  has_many :tasks, dependent: :destroy

  before_destroy :last_admin_not_delete
  before_update  :last_admin_not_update

  private
  def last_admin_not_delete
    if self.admin && User.where(admin: true).count == 1
      throw :abort
    end
  end
  def last_admin_not_update
    user = User.where(id: self.id).where(admin: true)
    if self.admin == false && User.where(admin: true).count == 1 && user.present?
     throw :abort
    end
  end
end
