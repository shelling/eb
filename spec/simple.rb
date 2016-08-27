$:.unshift("lib")
require "eb"

class HelloListener < EB::Listener
  pattern /hello/
  handler :handler

  def handler(payload)
    puts "#{payload.inspect} in #{self.class}"
  end
end

class WorldListener < EB::Listener
  pattern /world/
  handler :handler

  def handler(payload)
    puts "#{payload.inspect} in #{self.class}"
  end
end

EB.subscribe(HelloListener.new)
EB.subscribe(WorldListener.new)
EB.publish(:hello, key: :value)
EB.publish(:world, key: :value)
