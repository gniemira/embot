require 'nokogiri'
require 'open-uri'

module Embot
  module MessageHandler
    class Bart < Base
      def process(message)
        return nil if !message.is_for_embot? or !message.command_is?('bart')
        return speak('say the short code of the station you are leaving from - like 16th or mcar - then the direction - like n or s') if message.no_parameters?
          

          station_info = message.parameters.split(' ')
          station = station_info[0].upcase
          dir = station_info[1].upcase
          
          key = "MMDH-TYY7-YW4Y-VSQU"
          # use all that bullshit to construct the url
          url = "http://api.bart.gov/api/etd.aspx?cmd=etd&orig=#{station}&key=#{key}&dir=#{dir}"
          # pass the url through nokogiri
          doc = Nokogiri::XML(open(url))
          
          stations = []
          
          # use xpath to load up all the etd nodes
          doc.xpath("//etd").each do |node|
            # get the name of the destination
            dest = node.xpath("destination").text
            # get all the minutes for that destination and stuff it in an array
            minutes = node.xpath("estimate/minutes").collect { |x| x.text + " minutes"}
            # turn it into text and strip out the garbage
            min = minutes.to_s.gsub('"', '').gsub('[', '').gsub(']', '')
            # print the results
            result = "there is a #{dest} train leaving in #{min}"
            stations << result
          end
        
          station_output = stations.join '| '
          return speak(station_output)
        
      end
    end
  end
end