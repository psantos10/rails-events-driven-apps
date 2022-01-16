# frozen_string_literal: true

Hutch::Config.set(:mq_host, ENV.fetch('RABBITMQ_HOST', '127.0.0.1'))
Hutch::Config.set(:mq_api_host, ENV.fetch('RABBITMQ_API_HOST', '127.0.0.1'))

Hutch::Config.set(:mq_exchange, 'payment_requests')
