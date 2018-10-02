class ChangeColumnForBandTable < ActiveRecord::Migration[5.0]
  def change
    change_column :bands, :stats, :text
  end
end
