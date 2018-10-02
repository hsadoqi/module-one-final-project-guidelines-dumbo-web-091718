class CreateBandAndPlayerAssociation < ActiveRecord::Migration[5.0]
  def change
    add_reference :players, :band
  end
end
