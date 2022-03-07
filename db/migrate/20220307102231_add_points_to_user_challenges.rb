class AddPointsToUserChallenges < ActiveRecord::Migration[6.1]
  def change
    add_column :user_challenges, :points, :integer, default: 0
  end
end
