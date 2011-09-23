require 'nokogiri'
require 'open-uri'
require 'cgi'

module Embot
  module MessageHandler
    class Fuck < Base
      def process(message)
        return speak('potty mouth!') if message.body.include? 'fuck'
        
        nil
      end
    end
  end
end