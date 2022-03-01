class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.time :start_time
      t.time :end_time
      t.text :content
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
