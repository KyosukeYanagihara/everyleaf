class Task < ApplicationRecord
  validates :name,  presence: true
  validates :description,  presence: true
  validates :deadline,  presence: true
  validates :status,  presence: true

  enum status:{ 未着手: 0, 着手中: 1, 完了: 2 }

  scope :sort_created, -> { order(created_at: :desc) }
  scope :sort_deadline, -> { order(deadline: :desc) }
  scope :search_name, -> (name) { where('name LIKE ?',"%#{name}%")}
  scope :search_status, -> (status) { where(status: status) }
end
