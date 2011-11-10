require 'httparty'
require 'crack'

module Embot
  module MessageHandler
    class Yelp < Base
      def process(message)
        return nil if !message.is_for_embot? or !message.command_is?('yelp')
        return speak('Command is "yelp term location". I need two parameters. First tell me what you want, then where to find it. For example you could say something like: cheeseburger 5th and Howard San Francisco') if message.no_parameters?
        
        begin
        
          params = message.parameters.split(' ', 2)
          term = params[0]
          location = params[1]
        
          results = []
          
          results << "yelped you #{term} at #{location}"
        
          term = term.strip.gsub(' ', '%')
          location = location.strip.gsub(' ', '%')
          ywsid = "kpv7Rr_Fh6vtmEh5fWCGPA"
          doc = HTTParty.get("http://api.yelp.com/business_review_search?term=#{term}&location=#{location}&limit=5&radius=1&ywsid=#{ywsid}")
          yelp_results = Crack::JSON.parse(doc)
          biz = yelp_results['businesses']
          biz.each do |x|
            name = x['name']
            distance = x['distance']
            avg_rating = x['avg_rating']
            address1 = x['address1']
            address2 = x['address2']
            address3 = x['address3']
            city = x['city']
            state = x['state']
            zip = x['zip']
            url = x['url']
          
            result = "#{name} - #{avg_rating} stars - #{address1} #{city}, #{state} #{zip} - #{url}"
            results << result
              
          end   
          
          results = results.join(' >>> ') 
          
          return speak(results)
        
        rescue
          return speak("Tsk tsk, #{message.user_firstname}. That was an ugly URI")
        end
      end
    end
  end
end