class CambiandoColumna < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :sele1, :documento
    rename_column :items, :sele2, :serie2
    rename_column :items, :sele3, :ndocu2
  end
end
