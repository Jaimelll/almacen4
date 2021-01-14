class ChangeDefaultClientId < ActiveRecord::Migration[5.0]
  def change
    change_column_default :items, :client_id, 881
  end
end
