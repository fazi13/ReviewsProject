class ReviewController < ApplicationController
  before_action :set_renter
  before_action :authenticate_user!
  before_action :req_authentication, only: [:edit, :update, :destroy]

  def new
    @review = Review.new(renters: @renter)
  end

  def create
    @review = current_user.review.build(review_params)
    @review.renters = @renter
    if @review.save 
      @renter.update(renter_params)
      redirect_to @renter 
    else
      flash[:danger] = @review.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to @renter
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @renter 
  end

  private
    def set_renter
      @renter = Renters.find(params[:renter_id])
    end

    def req_authentication
      @review = Review.find(params[:id])
      if !current_user.try(:admin?) && current_user.id != @review.user.id
        flash[:danger] = "You do not have the correct privilidges"
        redirect_back(fallback_location: root_path)
      end
    end

    def review_params
      params.require(:review).permit(:comment, :rating, :years, :property_type_id, :address1, :address2, :city, :state, :zipcode)
    end

    def renter_params
      params.require(:review).permit(:city, :state)
    end
end