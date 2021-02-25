class Task < ApplicationRecord
  validates :name,  presence: true
  validates :description,  presence: true
  validates :deadline,  presence: true
  validates :status,  presence: true
end
