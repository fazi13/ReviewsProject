class AddLatLonToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :latitude, :float
    add_column :reviews, :longitude, :float
  end
end
