class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :creditcard
      t.datetime :expdate
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
