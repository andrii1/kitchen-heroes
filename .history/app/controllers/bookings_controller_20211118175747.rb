class BookingsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.user = current_user
    if @booking.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def accept

  end

  def reject
  end

  private

  def booking_params
    params.require(:booking).permit(:date_booking)
  end
end
