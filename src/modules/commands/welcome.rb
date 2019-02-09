module Bot
  module Commands
    # Command Module
    module Welcome
      extend Discordrb::Commands::CommandContainer
      command(
        :welcome,
        description: 'Toggle server welcome DM from the bot',
        usage: 'welcome',
        required_permissions: [:administrator],
        permission_message: 'Only an admin can use %name%'
      ) do |event|
        Database::CommandLog.resolve_name('Welcome').log
        if Database::Server.resolve_id(event.server.id).toggle_welcome_message(event.channel.id)
          'Users will now be sent a welcome message in this channel when joining.'
        else
          'Users will no longer be sent a welcome message in this server when joining.'
        end
      end
    end
  end
end
