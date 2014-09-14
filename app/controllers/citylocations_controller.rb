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
 
end
