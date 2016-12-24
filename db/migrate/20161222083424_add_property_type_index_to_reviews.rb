class AddPropertyTypeIndexToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :property_type, index: true
  end
end
