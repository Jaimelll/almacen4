class AddIscToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :isc, :float
    add_column :items, :bolsas, :float
    add_column :items, :oconceptos, :float
  end
end
