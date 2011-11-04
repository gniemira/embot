module Embot
  module MessageHandler

    class Yourewelcome < Base
      def process(message)

        if message.is_text_message? and message.matches_regex?(/^(thanks|thank you|thankx|kthankx) bender/i)
          return yourewelcome_user(message)
        else
          return nil
        end
      end

      private

      def yourewelcome_user(message)
        predicate = ["Sure thing", "No prob", "WORD", "Yeah yeah yeah", "I know how great I am,"].sample
        speak("#{predicate} #{message.user_firstname}")
      end
    end
  end
end
