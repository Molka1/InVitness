class AddProofToChallenges < ActiveRecord::Migration[6.1]
  def change
    add_column :challenges, :proof, :string
  end
end
