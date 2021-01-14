class AddSeleToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :sele, :integer
    add_column :items, :sele1, :integer
    add_column :items, :sele2, :string
    add_column :items, :sele3, :string
  end
end
