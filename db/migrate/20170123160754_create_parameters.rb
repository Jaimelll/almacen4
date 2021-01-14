class CreateParameters < ActiveRecord::Migration[5.0]
  def change
    create_table :parameters do |t|
      t.integer :empresa
      t.integer :origen
      t.date :mes

      t.timestamps
    end
  end
end
