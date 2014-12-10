class AddInvoiceSentTimeToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :invoice_sent_time, :datetime
  end
end
