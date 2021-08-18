class AddWeightToTrainings < ActiveRecord::Migration[6.1]
  def change
    add_column :trainings, :weight, :float
  end
end
