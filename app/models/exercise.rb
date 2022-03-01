class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :content, presence: true
end
