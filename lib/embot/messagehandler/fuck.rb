module Embot
  module MessageHandler
    class Fuck < Base
      def process(message)
        if message.body.nil?
          return nil
        else
          body = message.body.downcase
          if body.include? 'fuck'
            return speak(return_prudery) 
          else
            return nil
          end
        end
      end
      
      private
      
      def return_prudery
        prudery = ['you did not just say that',
                    'how dare you',
                    'gasp!',
                    'potty mouth!',
                    'you kiss your mother with that mouth?',
                    'say what?'
          ]
        prudery.sample
      end
    end
  end
end