module PaymentRequestsHelper
  STATUS_LABELS = {
    'pending' => 'warning',
    'accepted' => 'success',
    'rejected' => 'danger'
  }.freeze

  def payment_request_status_badge(payment_status)
    content_tag(:span, payment_status.capitalize, class: "badge bg-#{STATUS_LABELS[payment_status]}")
  end
end
