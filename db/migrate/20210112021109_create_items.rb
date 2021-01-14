class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.date :pfecha
      t.string :serie
      t.string :nfactu
      t.references :client, foreign_key: true, default: 881
      t.float :subtotal
      t.integer :origen
      t.date :mmes
      t.integer :moneda, default: 1
      t.float :tc, default: 0.0
      t.references :user, foreign_key: true, default: 3
      t.integer :empresa
      t.integer :sele
      t.integer :documento
      t.string :serie2
      t.string :ndocu2
      t.string :ruc
      t.string :razon
      t.string :detalle
      t.string :razon2
      t.integer :nuevo, default: 1
      t.float :monto
      t.float :isc
      t.float :bolsas
      t.float :oconceptos


      t.timestamps
    end
  end
end
