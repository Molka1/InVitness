class UserChallenge < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  validates :user, presence: true, uniqueness: { scope: :challenge }
  validates :challenge, presence: true
end
