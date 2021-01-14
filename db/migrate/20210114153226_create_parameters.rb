class CreateParameters < ActiveRecord::Migration[6.1]
  def change
    create_table :parameters do |t|
      t.integer :empresa
      t.integer :origen
      t.date :mes
      t.integer :sele
      t.integer :sele1
      t.string :sele2
      t.string :sele3

      t.timestamps
    end
  end
end
