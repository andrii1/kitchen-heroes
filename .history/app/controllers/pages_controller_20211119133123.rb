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
    @review
    if @chef
    @my_listings = current_user.listings
    @bookings_requests = Booking.where(listing_id: @my_listings.pluck(:id))
    end
  end


end
