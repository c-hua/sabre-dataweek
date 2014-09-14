class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :airport
      t.datetime :month
      t.float :maxprice
      t.float :minprice
      t.float :priceamount

      t.timestamps
    end
  end
end
