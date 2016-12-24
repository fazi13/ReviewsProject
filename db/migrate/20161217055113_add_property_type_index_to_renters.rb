class AddPropertyTypeIndexToRenters < ActiveRecord::Migration
  def change
    add_reference :renters, :property_type, index: true
  end
end
