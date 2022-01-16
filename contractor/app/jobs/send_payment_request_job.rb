# frozen_string_literal: true

class SendPaymentRequestJob < ApplicationJob
  queue_as :default

  def perform(payment_request_id:)
    payment_request = PaymentRequest.find(payment_request_id)
    return if payment_request.nil?

    # Publish the message to the queue
    Hutch.connect
    # For this exercise, I am sending the all object. I could (should) send only the id.
    # By sending only the ID, the consumer can request the object (all) from a REST API for example.
    Hutch.publish('pilot.payment_requests.new', payment_request)
  end
end
