class FixingTheMessThatIsOurDbTables < ActiveRecord::Migration[5.0]
  def change
    remove_column :bands, :stats

    add_column :bands, :tech_ability, :integer
    add_column :bands, :presentation, :integer
    add_column :bands, :stage_presence, :integer
    add_column :bands, :lyrics, :integer

    remove_column :judges, :preferences

    add_column :judges, :preferred_att1, :string
    add_column :judges, :preferred_att2, :string
  end
end
