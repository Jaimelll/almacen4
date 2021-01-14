class AddMontoToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :monto, :float
  end
end
