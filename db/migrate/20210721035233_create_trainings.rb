class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.integer :user_id
      t.string :start_time
      t.string :event
      t.integer :reps
      t.integer :sets

      t.timestamps
    end
  end
end
