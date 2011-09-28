require './lib/embot/messagehandler/base.rb'
require './lib/embot/messagehandler/bash.rb'
require './lib/embot/messagehandler/define.rb'
require './lib/embot/messagehandler/image.rb'
require './lib/embot/messagehandler/quote.rb'
require './lib/embot/messagehandler/greeter.rb'
require './lib/embot/messagehandler/fuck.rb'
require './lib/embot/messagehandler/lol.rb'
require './lib/embot/message.rb'
require './lib/embot.rb'
require 'tinder'

# The campfire subdomain of your account (xxxx.campfirenow.com)
CAMPFIRE_SUBDOMAIN = 'kiva'

# API authentication token for Embot user
CAMPFIRE_TOKEN     = '9899999f6667887cedff1ab50ea7f8d6c73b9ff1'

# Numerical ID of Embot user. Used to sort out messages from itself
CAMPFIRE_USER_ID   = 1337

# Name of the room that Embot should join
CAMPFIRE_ROOM      = 'ZombieChickens'

begin
  Embot::log("Logging into account on subdomain: #{CAMPFIRE_SUBDOMAIN} with token: #{CAMPFIRE_TOKEN[0...6]}")
  campfire = Tinder::Campfire.new(CAMPFIRE_SUBDOMAIN, :token => CAMPFIRE_TOKEN)

  Embot::log("finding room with name: #{CAMPFIRE_ROOM}")
  room = campfire.find_room_by_name(CAMPFIRE_ROOM)

  # Capture Ctrl+C interrupt for a nicer exit
  trap("INT") do
    Embot::log("Leaving room and exiting")
    room.speak("Goodbye for now!")
    room.stop_listening
    room.leave
    exit
  end

  Embot::log("Listening for messages ...")
  loop do
    room.listen do |message|
      begin
        next if Embot::Message.should_be_ignored?(message)
        message = Embot::Message.new(message)

        response = Embot::process_message(message)

        if !response.nil?
          room.send(response[:type], response[:body])
          Embot::log("Processed message: #{Embot::excerpt(message.body)}")
        end

        message  = nil
        response = nil
      rescue => e
        Embot::log("Exception caught: #{e.message}", :error)
        puts "Backtrace:\n#{e.backtrace}"
      end
    end

    sleep 5
  end
rescue => e
  Embot::log("Exception caught: #{e.message}", :error)
  puts "Backtrace:\n#{e.backtrace}"
  exit
end
