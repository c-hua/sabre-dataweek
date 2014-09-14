class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.string :location
      t.datetime :date
      t.datetime :time
      t.integer :maxbid

      t.timestamps
    end
  end
end
