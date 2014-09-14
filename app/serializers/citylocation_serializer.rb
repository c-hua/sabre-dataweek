class CitylocationSerializer < ActiveModel::Serializer
  attributes :id, :airport, :month, :maxprice, :minprice, :priceamount, :origin, :destination, :lengthofstay, :maxfare
end
