#require 'nokogiri'
#require 'open-uri'
#require 'cgi'

module Embot
  module MessageHandler
    class Fuck < Base
      def process(message)
        if message.nil?
          return nil
        else
          if message.body.include? 'fuck'
            return speak('potty mouth!') 
          else
            return nil
          end
        end
      end
    end
  end
end