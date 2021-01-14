class CreateFormulas < ActiveRecord::Migration[6.1]
  def change
    create_table :formulas do |t|
      t.references :product, foreign_key: true
      t.integer :material
      t.float :cantidad
      t.references :user, foreign_key: true      
      t.string :descripcion
      t.string :indicacion
      t.integer :orden
  

      t.timestamps
    end
  end
end
