class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string   :ruc
      t.text     :razon
      t.text     :direccion
      t.text     :obs
      t.integer  :tipo, default:1
      t.integer  :origen, default:1
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

