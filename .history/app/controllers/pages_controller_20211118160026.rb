class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @listings = Listing.all
  end

  def dashboard
    @listings = Listing.all
    @chef = current_user.listings.any?
    @user_bookings = current_user.bookings
    if @chef
    @my_listings = current_user.listings
    @my_bookings = Booking.where(listing_id: @my_listings.pluck(:id))
    end
  end
end
