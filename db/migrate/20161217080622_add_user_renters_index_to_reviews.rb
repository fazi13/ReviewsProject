class AddUserRentersIndexToReviews < ActiveRecord::Migration
  def change
      add_reference :reviews, :renters, index: true
      add_reference :reviews, :user, index: true
  end
end
