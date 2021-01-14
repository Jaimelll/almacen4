class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.date :pfecha
      t.string :serie
      t.string :nfactu
      t.references :client, foreign_key: true
      t.float :subtotal
      t.integer :origen
      t.date :mmes
      t.integer :moneda
      t.float :tc
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
