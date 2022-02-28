class CreateChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :challenges do |t|
      t.string :name
      t.float :amount
      t.date :start_date
      t.date :end_date
      t.string :code
      t.references :user, null: false, foreign_key: true
      t.boolean :private
      t.string :exercise_length
      t.string :maximum
      t.string :points
      t.boolean :rollover

      t.timestamps
    end
  end
end
