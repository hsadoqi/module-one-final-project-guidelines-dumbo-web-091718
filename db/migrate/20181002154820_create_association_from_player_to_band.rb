class CreateAssociationFromPlayerToBand < ActiveRecord::Migration[5.0]
  def change
    add_reference :bands, :player
  end
end
