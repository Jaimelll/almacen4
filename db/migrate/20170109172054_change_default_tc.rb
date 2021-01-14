class ChangeDefaultTc < ActiveRecord::Migration[5.0]
  def change

change_column_default :items, :tc, 0
change_column_default :items, :moneda, 1


  end
end
