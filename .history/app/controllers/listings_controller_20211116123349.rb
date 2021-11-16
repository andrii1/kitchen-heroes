def new
    @listing = Listing.new
    @listing = Listing.find(params[:listing_id])
  end
  def create
    @listing = Listing.find(params[:listing_id])
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy!
  end
  private
  def listing_params
    params.require(:listing).permit(:name, :description, :price, :location, :availability)
  end
