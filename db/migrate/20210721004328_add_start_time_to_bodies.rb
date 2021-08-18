class AddStartTimeToBodies < ActiveRecord::Migration[6.1]
  def change
    add_column :bodies, :start_time, :string
  end
end
