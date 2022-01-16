# frozen_string_literal: true

class NewPaymentRequestConsumer
  include Hutch::Consumer
  consume 'pilot.payment_requests.new'

  def process(message)
    # Here since I receive the all object, I will keep it simple
    # and call a class method to process and save the PaymentRequest locally.
    # In a real world scenario, a better approach could be receive only the ID
    # and do a syncronous call (REST, gRPC, graphql...) to get more data need to process the PaymentRequest.
    # This process also could be done in a background job.
    PaymentRequest.process_new_payment_request(message.body)
  end
end
