class Task < ApplicationRecord
  validates :name,  presence: true
  validates :description,  presence: true
  validates :deadline,  presence: true
  validates :status,  presence: true

  scope :sort_created, -> { order(created_at: :desc) }
  scope :sort_deadline, -> { order(deadline: :desc) }
  scope :search_name, -> (name) { where('name LIKE ?',"%#{name}%")}
  scope :search_status, -> (status) { where(status: status) }
end
