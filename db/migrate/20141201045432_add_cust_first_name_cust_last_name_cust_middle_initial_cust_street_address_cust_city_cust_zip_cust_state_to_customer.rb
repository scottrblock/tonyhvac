class AddCustFirstNameCustLastNameCustMiddleInitialCustStreetAddressCustCityCustZipCustStateToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :custFirstName, :string
    add_column :customers, :custLastName, :string
    add_column :customers, :custMiddleInitial, :string
    add_column :customers, :custStreetAddress, :string
    add_column :customers, :custCity, :string
    add_column :customers, :custZip, :integer
    add_column :customers, :custState, :string
  end
end
