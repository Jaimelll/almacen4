class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string   :ruc
      t.text     :razon
      t.text     :direccion
      t.text     :obs
      t.integer  :tipo, default:1
      t.integer  :origen, default:1
      t.timestamps
    end
  end
end
