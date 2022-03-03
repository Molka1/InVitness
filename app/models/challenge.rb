class Challenge < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy
  has_many :user_challenges, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :amount, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
  validates :exercise_length, presence: true
  validates :maximum, presence: true
  validates :points, presence: true
end
