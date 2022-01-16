# frozen_string_literal: true

class CreatePaymentRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_requests do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :currency, null: false
      t.text :description, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
