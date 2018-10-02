class CreatePerformanceAssociations < ActiveRecord::Migration[5.0]
  def change
    drop_table :performances

    create_table :performances, id: false do |t|
      t.integer :band_id
      t.integer :judge_id
    end

    add_index :performances, :band_id
    add_index :performances, :part_id
  end
end
