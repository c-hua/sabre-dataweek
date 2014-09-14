class CreateCitylocations < ActiveRecord::Migration
  def change
    create_table :citylocations do |t|
      t.string :airport
      t.datetime :month
      t.float :maxprice
      t.float :minprice
      t.float :priceamount

      t.timestamps
    end
  end
end
