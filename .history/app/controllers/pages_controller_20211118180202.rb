class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @listings = Listing.all
  end

  def dashboard
    @bookings = Booking.all
    @listings = Listing.all
    @chef = current_user.listings.any?
    @user_bookings = current_user.bookings
    if @chef
    @my_listings = current_user.listings
    @bookings_requests = Booking.where(listing_id: @my_listings.pluck(:id))
    end
  end

  def accept

  end

  def reject
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy!
    redirect_to listings_path
  end

end
