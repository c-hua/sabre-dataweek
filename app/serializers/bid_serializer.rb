class BidSerializer < ActiveModel::Serializer
  attributes :id, :location, :date, :time, :maxbid
end
