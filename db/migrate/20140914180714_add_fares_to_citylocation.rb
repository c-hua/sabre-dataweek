class AddFaresToCitylocation < ActiveRecord::Migration
  def change
  	add_column :citylocations, :origin, :string
  	add_column :citylocations, :destination, :string
  	add_column :citylocations, :lengthofstay, :integer
  	add_column :citylocations, :maxfare, :float
  end
end
