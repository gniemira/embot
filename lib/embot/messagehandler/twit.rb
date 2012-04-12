require 'twitter'

module Embot
  module MessageHandler

    class Twit < Base
      def process(message)
        return nil if !message.is_for_embot? || !message.command_is?('horse')
        speak(quote)
      end

      

      def get_quote
      	#horse_timeline = Twitter.user_timeline.('horse_ebooks')
      	#quote = horse_timeline.sample.text
      	quote = "UGH"
      	#return quote
    	end
    end
  end
end