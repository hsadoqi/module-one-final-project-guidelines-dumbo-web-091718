class ChangeGenresToBandTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :genres, :bands
    add_column :bands, :band_name, :string
  end
end
