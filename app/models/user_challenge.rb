class UserChallenge < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  validates :user, presence: true
  validates :challenge, presence: true
end
