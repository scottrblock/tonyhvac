class AddInvoiceStatusToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :invoice_status, :string, :default => "unsent"
  end
end
