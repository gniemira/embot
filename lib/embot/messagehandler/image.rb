require 'nokogiri'
require 'open-uri'
require 'cgi'

module Embot
  module MessageHandler

    # Image message handler
    #
    # This message handler will post a random image from Google Image Search
    # with the command parameters as search query
    #
    # Triggers on command: embot image [search query]
    class Image < Base
      def process(message)
        return nil if !message.is_for_embot? or !message.command_is?('image')
        return speak("Image of what?") if message.no_parameters?
        image_url = get_random_image_url(message.parameters)
        if image_url.nil?
          return speak("When searching for '#{message.parameters}' I found a picture of your mom and it was too big to fit on the screen")
        end
        speak(image_url)
      end

      private

      def get_random_image_url(query)
        query = query.gsub(/\s+/, "")
        page = Nokogiri::HTML(open("http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{query}"))
        result = JSON.parse(page)
        r = result['responseData']['results'].first
        return nil if r['url'].nil?
        return r['url'].to_s
      end
    end
  end
end
