class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.text :descripcion
      t.float :cantidad
      t.float :precio
      t.float :monto
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.references :product, foreign_key: true
  

      t.timestamps
    end
  end
end
