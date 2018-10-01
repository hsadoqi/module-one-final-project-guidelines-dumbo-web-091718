class CreatePerformance < ActiveRecord::Migration[5.0]
  def change
    create_table :performance do |t|
      t.string :sound_clip
      t.integer :audience_score
      t.integer :judge_score
      t.integer :final_score
    end 
  end
end
