class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :descripcion
      t.float :precio
      t.integer :moneda
      t.integer :unidad
      t.references :client, foreign_key: true  
      t.string :material
      t.float :lote
      t.integer :proceso
      t.integer :equivalente
      t.float :conversion
      t.float :peso
      t.boolean :activo, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
