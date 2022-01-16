# frozen_string_literal: true

class AcceptedPaymentConsumer
  include Hutch::Consumer
  consume 'pilot.payment_requests.accepted'

  def process(message)
    payload = message.body
    UpdatePaymentRequestJob.perform_later(payment_request_id: payload[:id], updated_status: :accepted)
  end
end
