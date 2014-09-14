class BidsController < ApplicationController

  def index
  	@bids = Bid.find_by_sql('SELECT * FROM bids ORDER BY created_at DESC')
  	 respond_to do |format|
      	format.html # index.html.erb
      	format.json { render json: @bids }
  end

  def compindex
  	@bids = Bid.find_by_sql('SELECT * FROM bids ORDER BY created_at DESC')
  	 respond_to do |format|
      	format.html # index.html.erb
      	format.json { render json: @bids }
  end

  def show
  	@bid = Bid.find(params[:id])
  end

  def new 
  	@bid = Bid.new
    @location = cookies[:location]
  end

  def create
    @location = cookies[:location]
  	@bid = Bid.new(bid_params)
  	if @bid.save(bid_params)
  		redirect_to bids_path
  	else
  		render 'new'
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
    @bid= Bid.find(params[:id])
    @bid.destroy
    redirect_to bids_path
  end

  def timecost
  	@maxbid = cookies[:maxbid]
  	# if @userbid <= @maxbid
  		# render 'notification'
  	# end
  end

  def 

  
  def bid_params
    params.require(:bid).permit(:location, :date, :time, :maxbid)
  end
end
