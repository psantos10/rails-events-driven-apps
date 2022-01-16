# frozen_string_literal: true

class PaymentRequest < ApplicationRecord
  enum status: { pending: 0, accepted: 1, rejected: 2 }

  validates :amount, :currency, :description, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :currency, inclusion: { in: %w[USD EUR GBP] }
  validates :status, inclusion: { in: statuses.keys }

  def accept!
    update!(status: :accepted)
    PublisherService.call('pilot.payment_requests.accepted', { id: })
  end

  def reject!
    update!(status: :rejected)
    PublisherService.call('pilot.payment_requests.rejected', { id: })
  end

  def self.process_new_payment_request(payload)
    parsed_amount = BigDecimal(payload[:amount])

    payment_request = PaymentRequest.new(
      id: payload[:id],
      amount: parsed_amount,
      currency: payload[:currency],
      description: payload[:description]
    )

    if parsed_amount < 500.00 || parsed_amount > 5000.00
      payment_request.status = :rejected
      payment_request.note = 'The amount is less than 500.00 or greater than 5000.00'
    elsif parsed_amount >= 500.00 && parsed_amount <= 2500.00
      payment_request.status = :accepted
      payment_request.note = 'Payment Request Approved'
    else
      # Require manual approval
      payment_request.status = :pending
      payment_request.note = 'Waiting manual approval'
    end

    payment_request.save!

    # Now I am only sending the ID.
    # The Contrator app already have all data needed.
    PublisherService.call("pilot.payment_requests.#{payment_request.status}", { id: payload[:id] })
  end
end
