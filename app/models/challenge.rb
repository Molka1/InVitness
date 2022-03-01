class Challenge < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :exercise_length, presence: true
  validates :maximum, presence: true
  validates :points, presence: true
end
