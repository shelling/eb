module EB
  autoload :Listener,     "eb/listener"
  autoload :Registration, "eb/registration"

  class << self
    def publish(event, payload)
      Registration.instance.publish(event, payload)
      self
    end

    def subscribe(listener)
      Registration.instance.listeners << listener
    end
  end
end
