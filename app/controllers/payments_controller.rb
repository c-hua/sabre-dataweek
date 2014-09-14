class PaymentsController < ApplicationController
  respond_to :json, :html

  # def index
  #   @payments = Payment.find_by_sql('SELECT * FROM payments ORDER BY created_at DESC')
  
  # end

  # def compindex
  #   @payments = Payment.find_by_sql('SELECT * FROM payments ORDER BY created_at DESC')

  # end

  def show
    @payment= Payment.find(params[:id])
  end

  def new 
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
  end


  def payment_params
    params.require(:payment).permit(:creditcard, :expdate, :name, :address, :city, :state, :zip)
  end

end
