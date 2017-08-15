module Bot
  module Events
    # Ready event
    module Join
      extend Discordrb::EventContainer
      member_join do |event|
        if Database::Server.resolve_id(event.server.id).has_welcome_message
          BOT.channel(event.server.id).send_message(event.user.mention + Database::Server.resolve_id(event.server.id).welcome_message) 
        end
      end
    end
  end
end
