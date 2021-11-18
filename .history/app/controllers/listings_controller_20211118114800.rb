class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    if params[:query].present?
      @listings = Listing.where(name: params[:query])
    else
      @listings = Listing.all
    end
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude
      }
    end
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
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

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :location, :availability, :photo)
  end
end
