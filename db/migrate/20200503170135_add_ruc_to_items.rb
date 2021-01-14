class AddRucToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :ruc, :string
    add_column :items, :razon, :string
    add_column :items, :detalle, :string
    add_column :items, :razon2, :string
    add_column :items, :nuevo, :integer, default:1
    
  end
end
