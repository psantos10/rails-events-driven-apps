# frozen_string_literal: true

class PaymentRequest < ApplicationRecord
  enum status: { pending: 0, accepted: 1, rejected: 2 }

  validates :amount, :currency, :description, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :currency, inclusion: { in: %w[USD EUR GBP] }

  after_create :send_payment_request

  private

  def send_payment_request
    SendPaymentRequestJob.perform_later(payment_request_id: id)
  end
end
