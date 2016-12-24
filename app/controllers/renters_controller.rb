class RentersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :show]
  before_action :is_admin?, only: [:edit, :update, :destroy]

	def index
    visitor_lat = request.location.latitude
    visitor_long = request.location.longitude
    #hard-coded location to San Jose, CA for testing purposes
    #visitor_lat = 37.3382
    #visitor_long = -121.8863
    search_range = 50 #distance from visitor location in miles

    @renters = Renters.near([visitor_lat, visitor_long], search_range)
    @reviews = Review.where(renters_id: @renter)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
	end

  def new
    @renter = Renters.new
  end

  def create
    @renter = Renters.new(renter_params)
    if @renter.save
      redirect_to @renter
    else
      flash[:danger] = @renter.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @renter = Renters.find(params[:id])
    @reviews = Review.where(renters_id: @renter)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def search
    @renter = Renters.search(params)
    @reviews = Review.where(renters_id: @renter)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def edit
    @renter = Renters.find(params[:id])
  end

  def update
    @renter = Renters.find(params[:id])
    @renter.update(renter_params)
    redirect_to @renter
  end

  def destroy
    @renter = Renters.find(params[:id])
    @renter.destroy
    redirect_to root_path 
  end

  private
    def renter_params
      params.require(:renters).permit(:fname, :lname, :license_no, :description, :city, :state, :phone, :email)
    end

    def is_admin?
      if !current_user.try(:admin?)
        flash[:danger] = "You do not have the correct privilidges"
        redirect_back(fallback_location: root_path)
      end
    end

end