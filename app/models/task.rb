class Task < ApplicationRecord
  validates :name,  presence: true
  validates :description,  presence: true
  validates :deadline,  presence: true
  validates :status,  presence: true
  validates :priority,  presence: true

  belongs_to :user
  
  enum status:{ 未着手: 0, 着手中: 1, 完了: 2 }
  enum priority:{ 低: 0, 中: 1, 高: 2 }

  scope :sort_created, -> { order(created_at: :desc) }
  scope :sort_priority, -> { order(priority: :desc) }
  scope :sort_deadline, -> { order(deadline: :asc) }
  scope :search_name, -> (name) { where('name LIKE ?',"%#{name}%")}
  scope :search_status, -> (status) { where(status: status) }
end
