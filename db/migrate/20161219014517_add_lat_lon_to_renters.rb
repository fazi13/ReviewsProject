class AddLatLonToRenters < ActiveRecord::Migration
  def change
    add_column :renters, :latitude, :float
    add_column :renters, :longitude, :float
  end
end
