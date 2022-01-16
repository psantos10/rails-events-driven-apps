# frozen_string_literal: true

class PublisherService
  def self.call(routing_key, payload)
    Hutch.connect

    Hutch.publish(routing_key, payload)
  end
end
