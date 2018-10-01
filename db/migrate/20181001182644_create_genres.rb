class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :genre_type
      t.integer :presentation
      t.integer :stage_presence
      t.integer :tech_ability
      t.integer :lyrics
    end
  end
end
