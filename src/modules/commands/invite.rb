module Bot
  module Commands
    # Command Name
    module Invite
      extend Discordrb::Commands::CommandContainer
      command(
        :invite,
        description: 'Shows the invite link for the bot',
        usage: 'invite'
      ) do |_event|
        Database::CommandLog.resolve_name('Invite').log
        "Invite Link: <#{BOT.invite_url(permission_bits: 2_080_898_303)}>"
      end
    end
  end
end
