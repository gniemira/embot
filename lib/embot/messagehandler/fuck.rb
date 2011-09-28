#require 'nokogiri'
#require 'open-uri'
#require 'cgi'

module Embot
  module MessageHandler
    class Fuck < Base
      def process(message)
        if message.is_leave?
          return nil
        else
          if message.body.include? ('fuck' || 'shit')
            return speak('potty mouth!') 
          else
            return nil
          end
        end
      end
    end
  end
end