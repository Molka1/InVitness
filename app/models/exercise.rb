class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_one_attached :photo
  # CHALLENGES = Challenge.where(current_user == UserChallenge.find(id: current_user).user_id )

  validates :name, presence: true
  validates :photo, presence: true
  validates :challenge, presence: true
end
