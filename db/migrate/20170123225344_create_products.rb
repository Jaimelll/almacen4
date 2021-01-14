class CreateProducts < ActiveRecord::Migration[5.0]
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

      t.timestamps
    end
  end
end
