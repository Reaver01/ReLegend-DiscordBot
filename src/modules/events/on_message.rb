module Bot
  module Events
    # Message event
    module Message
      extend Discordrb::EventContainer
      message do |event|
        # Do something on message event
      end
    end
  end
end
