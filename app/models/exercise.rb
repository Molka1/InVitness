class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  # CHALLENGES = Challenge.where(current_user == UserChallenge.find(id: current_user).user_id )

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :content, presence: true
  validates :challenge, presence: true
end
