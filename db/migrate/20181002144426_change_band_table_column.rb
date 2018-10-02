class ChangeBandTableColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :bands, :attributes, :stats
  end
end
