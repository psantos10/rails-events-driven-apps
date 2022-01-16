# frozen_string_literal: true

class UpdatePaymentRequestJob < ApplicationJob
  queue_as :default

  def perform(payment_request_id:, updated_status:)
    payment_request = PaymentRequest.find(payment_request_id)
    return if payment_request.nil?

    payment_request.update(status: updated_status)
  end
end
