class AddNoteToPaymentRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :payment_requests, :note, :text
  end
end
