class AddInvoicePaidtimeToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :invoice_paid_time, :datetime
  end
end
