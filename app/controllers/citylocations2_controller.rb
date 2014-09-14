class CitylocationsController < ApplicationController

  def index
    @citylocations = Citylocation.find_by_sql('SELECT * FROM citylocations ORDER BY created_at DESC')
     respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @citylocations }
  end

  def compindex
    @citylocations = Citylocation.find_by_sql('SELECT * FROM citylocations ORDER BY created_at DESC')
     respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @citylocations }
  end

  def show
    @citylocation = Citylocation.find(params[:id])
  end

  def new 
    @citylocation = Citylocation.new
    @airport = cookies[:airport]
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @citylocations }
  end

  def create
    @airport = cookies[:airport]
    @citylocation = Citylocation.new(citylocation_params)
      if @citylocation.save(citylocation_params)
      redirect_to citylocations_path
      else
      render 'new'
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @citylocations }
      end
      end

  def edit
    @citylocation = Citylocation.find(params[:id])
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @citylocations }
  end

  def update
    @citylocation = Citylocation.find(params[:id])
    if @citylocation.update(citylocation_params)
      redirect_to citylocations_compindex_path
    else 
      render 'edit'
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @citylocations }
    end
    end

  def destroy
    @citylocation= Citylocation.find(params[:id])
    @citylocation.destroy
    redirect_to citylocations_path
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @citylocations }
  end
end
  
  def citylocation_params
    params.require(:citylocation).permit(:airport, :month, :maxprice, :minprice, :priceamount)
  end

end
