class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :challenges, dependent: :destroy
  has_many :exercises,  dependent: :destroy
  has_many :user_challenges, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
