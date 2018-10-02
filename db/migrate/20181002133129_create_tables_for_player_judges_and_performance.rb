class CreateTablesForPlayerJudgesAndPerformance < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
    end

    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.string :attributes
      t.float :grade
      t.integer :applause_level
    end

    create_table :judges do |t|
      t.string :name
      t.string :preferences
    end

  end
end
