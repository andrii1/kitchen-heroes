class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    raise
    if @review.save
      redirect_to dashboard_path
    else
      render 'pages/dashboard'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
