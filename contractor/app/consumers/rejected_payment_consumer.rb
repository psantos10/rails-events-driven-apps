# frozen_string_literal: true

class RejectedPaymentConsumer
  include Hutch::Consumer
  consume 'pilot.payment_requests.rejected'

  def process(message)
    payload = message.body
    UpdatePaymentRequestJob.perform_later(payment_request_id: payload[:id], updated_status: :rejected)
  end
end
