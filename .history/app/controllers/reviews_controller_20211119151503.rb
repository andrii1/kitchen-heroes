class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to booking_path(@booking)
    else
      render 'listings/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
