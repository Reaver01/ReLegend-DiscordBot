module Bot
  module Events
    # Ready event
    module Ready
      extend Discordrb::EventContainer
      ready do |_event|
        # Load Kickstarter
        project = KICKSCRAPER.search_projects('Re:Legend - Co-op Monster-Raising RPG').first
        
        # Set game text
        BOT.game = "S$ #{project.pledged.to_i.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse} pledged!"

        # Tell the console BOT is ready
        puts 'BOT Ready!'
      end
    end
  end
end
