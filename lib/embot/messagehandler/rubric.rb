module Embot
  module MessageHandler

    class Rubric < Base
      def process(message)
        return nil if !message.is_for_embot? || !message.command_is?('rubric')
        speak(nameify)
      end

      private

      def nameify  
        rubric_list = ["rocket", "laser",	"dinosaur",	"old people",	"tiger", "chicken",	"steel",	"crystal",	"engine",	"lady",	"baby",	"rhino",	"panda",	"apocalypse",	"zombie",	"ninja",	"harrison ford",	"space",	"underpants",	"future",	"robot",	"chocolate",	"shark",	"jet",	"gun",	"guitar solo",	"beard",	"sparkle",	"fire",	"monkey",	"cyber",	"fist",	"unicorn",	"mustache", "juice", "winning", "charlie sheen", "rapture", "torture", "spasm", "bro", "manzierre", "lady gaga", "worm", "Premal's phone", "jedi", "toupee", "botox", "cheeseburger", "Coolio", "Tom Brady", "bone", "Poland", "George W. Bush", "satin", "butter", "muffin", "milkshake", "cream pie", "sword", "giant", "queen", "bear", "rainbow", "tornado", "lips", "carrot", "donut", "fraternity", "Salesforce", "trophy", "penguin", "Jon Kart", "shake weight", "snuggie", "Goulet"]
        name = rubric_list.sample + " " + rubric_list.sample
        return name
      end
           
      end
    end
  end