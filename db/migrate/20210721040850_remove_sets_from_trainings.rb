class RemoveSetsFromTrainings < ActiveRecord::Migration[6.1]
  def change
    remove_column :trainings, :sets
  end
end
