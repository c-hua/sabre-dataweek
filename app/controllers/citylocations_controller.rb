class CitylocationsController < ApplicationController

  def index
    @citylocations = Citylocation.find_by_sql('SELECT * FROM citylocations ORDER BY created_at DESC')

  end

  def compindex
    @citylocations = Citylocation.find_by_sql('SELECT * FROM citylocations ORDER BY created_at DESC')
  end


  def citylocations_params
    params.require(:citylocations).permit(:airport, :month, :maxprice, :minprice, :priceamount)
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

 

