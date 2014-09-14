class CitylocationsController < ApplicationController
  respond_to :json, :html

  def index
    @citylocations = Citylocation.find_by_sql('SELECT * FROM citylocations ORDER BY created_at DESC')
    respond_with @citylocations
  end

  def compindex
    @citylocations = Citylocation.find_by_sql('SELECT * FROM citylocations ORDER BY created_at DESC')
    respond_with @citylocations
  end

  def show
    @citylocation= Citylocation.find(params[:id])
  end

  def new 
    @citylocation = Citylocation.new
  end

  def create
    @citylocation = Citylocation.new(citylocation_params)
    

    if @citylocation.save
      respond_to do |format|
        format.html { redirect_to citylocations_path }
        format.json { render json: @citylocation, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @citylocation.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @citylocation = Citylocation.find(params[:id])
  end

  def update
    @citylocation = Citylocation.find(params[:id])
    if @citylocation.update(citylocation_params)
      redirect_to citylocations_compindex_path
    else 
      render 'edit'
    end
  end

  def destroy
    @citylocation = Citylocation.find(params[:id])
    @citylocation.destroy
    redirect_to citylocation_path
  end

  def citylocation_params
    params.require(:citylocation).permit(:airport, :month, :maxprice, :minprice, :priceamount, :origin, :destination, :lengthofstay, :maxfare)
  end

  private

  def sabre_init

  @sabre = SabreDevStudio::REST::Client.new do |config|
  config.client_id        = 'VjE6dHkycGFxOTB6d2pwcXl2aDpERVZDRU5URVI6RVhU'
  config.client_secret    = 'TzBzNEJmb0c='
  config.uri              = 'https://api.test.sabre.com/'

    end
  end

 def sabre_params
    params.require(:fares).permit(:terms_attributes => [:origin, :destination, :lengthofstay, :maxfare])
 end

  def get_fares(options)

    @fares = @sabre.search(search, :result_type => "recent").take(15)

  end
end

 

