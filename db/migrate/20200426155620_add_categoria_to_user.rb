class AddCategoriaToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :categoria, :integer, :default => 1
    add_column :users, :empresa, :integer
    add_column :users, :periodo, :integer
    add_column :users, :sele, :integer
  end
end
