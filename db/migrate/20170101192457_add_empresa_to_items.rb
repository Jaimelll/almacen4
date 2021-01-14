class AddEmpresaToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :empresa, :integer
  end
end
