class BidsController < ApplicationController
  respond_to :json, :html

  def index
    @bids = Bid.find_by_sql('SELECT * FROM bids ORDER BY created_at DESC')
    respond_with @bids
  end

  def compindex
    @bids = Bid.find_by_sql('SELECT * FROM bids ORDER BY created_at DESC')
    respond_with @bids
  end

  def show
    @bid= Bid.find(params[:id])
  end

  def new 
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    

    if @bid.save
      respond_to do |format|
        format.html { redirect_to bids_path }
        format.json { render json: @bid, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update(bid_params)
      redirect_to bids_compindex_path
    else 
      render 'edit'
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    redirect_to bids_path
  end

  def matchbid
    @bid = Bid.find(params[:id])
    @maxfare = Citylocation.find(params[:maxfare])
      if @bid <= @maxfare
        render 'notification'
      else
        redirect to bids_compindex_path
      end
  end


  def bid_params
    params.require(:bid).permit(:location, :date, :time, :maxbid)
  end
  def citylocation_params
    params.require(:citylocation).permit(:airport, :month, :maxprice, :minprice, :priceamount, :origin, :destination, :lengthofstay, :maxfare)
  end
end
