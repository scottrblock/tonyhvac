class AddContractorFields < ActiveRecord::Migration
  def change
    add_column :contractors, :subFirstName, :string
    add_column :contractors, :subLastName, :string
    add_column :contractors, :subMiddleInitial, :string
    add_column :contractors, :subStreetAddress, :string
    add_column :contractors, :subCity, :string
    add_column :contractors, :subZip, :integer
    add_column :contractors, :subState, :string
    add_column :contractors, :subType, :string
  end
end
