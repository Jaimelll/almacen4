class AddOrdenToFormulas < ActiveRecord::Migration[5.0]
  def change
    add_column :formulas, :orden, :integer
  end
end
