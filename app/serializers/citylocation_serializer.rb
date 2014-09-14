class CitylocationSerializer < ActiveModel::Serializer
  attributes :id, :airport, :month, :maxprice, :minprice, :priceamount
end
