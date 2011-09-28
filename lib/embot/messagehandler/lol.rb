module Embot
  module MessageHandler
    class Lol < Base
      def process(message)
        if message.body.include? ('ROFL' || 'lol')
          return speak('LMFAO yall') 
        else
          return nil
        end
      end
    end
  end
end