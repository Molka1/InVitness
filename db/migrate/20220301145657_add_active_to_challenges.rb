class AddActiveToChallenges < ActiveRecord::Migration[6.1]
  def change
    add_column :challenges, :active, :boolean, default: false
  end
end
