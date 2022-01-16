# frozen_string_literal: true

class PaymentRequestsController < ApplicationController
  def index
    @pending_payment_requests = PaymentRequest.pending
    @accepted_payment_requests = PaymentRequest.accepted
    @rejected_payment_requests = PaymentRequest.rejected
  end

  def accept
    payment_request = PaymentRequest.find(params[:id])
    payment_request.accept!

    redirect_to root_path
  end

  def reject
    payment_request = PaymentRequest.find(params[:id])
    payment_request.reject!

    redirect_to root_path
  end
end
