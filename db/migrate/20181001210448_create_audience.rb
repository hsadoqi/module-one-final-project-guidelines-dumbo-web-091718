class CreateAudience < ActiveRecord::Migration[5.0]
  def change
    create_table :audience do |t|
      t.integer :grade
    end 
  end
end
