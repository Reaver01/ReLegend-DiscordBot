module Bot
  module Events
    # Ready event
    module Join
      extend Discordrb::EventContainer
      member_join do |event|
        if Database::Server.resolve_id(event.server.id).has_welcome_message
          if event.user.username =~ /.*(discord\.gg\/\w+)/ || event.user.display_name =~ /.*(discord\.gg\/\w+)/
            # User is either advertising or attacking another server, we'll ban them.
            event.server.ban(event.user)
          elsif event.user.username =~ /.*(discord\.me\/\w+)/ || event.user.display_name =~ /.*(discord\.me\/\w+)/
            event.server.ban(event.user)
          elsif event.user.username =~ /.*(twitter\.com)/ || event.user.display_name =~ /.*(twitter\.com)/
            event.server.ban(event.user)
          elsif event.user.username =~ /.*(twitch\.tv)/ || event.user.display_name =~ /.*(twitch\.tv)/
            event.server.ban(event.user)
          else
            BOT.channel(Database::Server.resolve_id(event.server.id).channel).send_message(event.user.mention + ' ' + Database::Server.resolve_id(event.server.id).welcome_message)
          end
        end
      end
    end
  end
end
