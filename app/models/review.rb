class Review < ActiveRecord::Base

  belongs_to :user
	belongs_to :renters
  has_many :property_type

  validates_presence_of :comment
  validates_presence_of :rating
  validates_presence_of :years
  validates_presence_of :address1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode
  validates_presence_of :property_type_id

  geocoded_by :full_address
  after_validation :geocode 

  def full_address
    [address1, address2, city, state, zipcode].join(',')
  end

end