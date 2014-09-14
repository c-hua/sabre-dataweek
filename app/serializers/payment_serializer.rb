class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :creditcard, :expdate, :name, :address, :city, :state, :zip
end
