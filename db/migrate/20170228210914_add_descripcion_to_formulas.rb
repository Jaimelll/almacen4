class AddDescripcionToFormulas < ActiveRecord::Migration[5.0]
  def change
    add_column :formulas, :descripcion, :string
    add_column :formulas, :indicacion, :string
  end
end
