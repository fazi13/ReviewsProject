class Renters < ActiveRecord::Base
	
	has_many :review
  validates_uniqueness_of :license_no, :message => 'of Renter already exists, please use the search button'
  validates_presence_of :fname
  validates_presence_of :lname
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :license_no

  geocoded_by :full_address
  after_validation :geocode 

  def full_address
    [city, state].join(',')
  end

  def self.search(params)
    license_query = "%#{params[:license]}%"
    id_query = "%#{params[:id]}%"
    renters = Renters.where("license_no LIKE ?", license_query) if params[:license].present?
    #renters = Renters.where("id LIKE ?", id_query) if params[:id].present?
    #renters = Renters.where("name LIKE ? or description LIKE ?", "%#{{params[:search]}}%", "%#{{params[:search]}}%") if params[:search].present?
    #renters = Renters.near(params[:location], 20) if params[:location].present?
  end
end