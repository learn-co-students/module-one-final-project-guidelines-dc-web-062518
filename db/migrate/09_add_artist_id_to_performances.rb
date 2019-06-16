class AddArtistIdToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :artist_id, :integer
  end
end
