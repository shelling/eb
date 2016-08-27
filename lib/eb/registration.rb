require "singleton"

module EB
  class Registration
    include Singleton

    def publish(event, payload)
      listeners.each do |listener|
        listener.receive(event, payload)
      end
    end

    def listeners
      @listeners ||= []
    end
  end
end
