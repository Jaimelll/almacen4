class AddPesoToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :peso, :float
    add_column :products, :activo, :boolean, default:true
        
  end
end
