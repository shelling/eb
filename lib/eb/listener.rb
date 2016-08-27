module EB
  class Listener
    class << self
      def pattern(pattern = nil)
        @pattern = pattern || @pattern
      end

      def handler(handler = nil)
        @handler = handler || @handler
      end
    end

    def receive(event, payload)
      self.send(self.class.handler, payload) if self.class.pattern === event
    rescue Exception
      puts "error"
    end
  end
end
