# frozen_string_literal: true

class CreatePaymentRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_requests do |t|
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.string :currency, null: false
      t.text :description, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
