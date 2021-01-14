class ChangeUserIdToItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :user_id, :integer, :default => 3
    
  end
end
