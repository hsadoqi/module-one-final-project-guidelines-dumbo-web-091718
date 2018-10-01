class CreateJudges < ActiveRecord::Migration[5.0]
  def change
    create_table :judges do |t|
      t.string :name
      t.string :preferences
      t.integer :grade
      t.string :response
    end
  end
end
