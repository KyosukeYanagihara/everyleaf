class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :tasks, through: :labellings
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :all_blank
end
