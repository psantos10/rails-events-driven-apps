# frozen_string_literal: true

Hutch::Logging.logger = Rails.logger

client_logger = Logger.new(Rails.root.join("log/hutch_#{Rails.env}.log"))
Hutch::Config.set(:client_logger, client_logger)

Hutch::Config.set(:mq_exchange, 'payment_requests')
