class AddSeleToParameters < ActiveRecord::Migration[5.0]
  def change
    add_column :parameters, :sele, :integer
    add_column :parameters, :sele1, :integer
    add_column :parameters, :sele2, :string
    add_column :parameters, :sele3, :string
  end
end
