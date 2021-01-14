class CreateFormulas < ActiveRecord::Migration[5.0]
  def change
    create_table :formulas do |t|
      t.references :product, foreign_key: true
      t.integer :material
      t.float :cantidad
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
