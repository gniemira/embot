module Embot
  module MessageHandler

    class Rubric < Base
      def process(message)
        return nil if !message.is_for_embot? || !message.command_is?('rubric')
        speak(nameify)
      end

      private

      def nameify  
        rubric_list = [ "rocket", 
                        "laser",	
                        "dinosaur",	
                        "old people",	
                        "tiger", 
                        "chicken",	
                        "steel",	
                        "crystal",	
                        "engine",	
                        "lady",	
                        "baby",	
                        "rhino",	
                        "panda",	
                        "apocalypse",	
                        "zombie",	
                        "ninja",	
                        "harrison ford",	
                        "space",	
                        "underpants",	
                        "future",	
                        "robot",	
                        "chocolate",	
                        "shark",	
                        "jet",	
                        "gun",	
                        "guitar solo",	
                        "beard",	
                        "sparkle",	
                        "fire",	
                        "monkey",	
                        "cyber",	
                        "fist",	
                        "unicorn",	
                        "mustache", 
                        "juice", 
                        "winning", 
                        "charlie sheen", 
                        "rapture", 
                        "torture", 
                        "spasm", 
                        "bro", 
                        "jedi", 
                        "toupee",
                        "cheeseburger",
                        "Coolio",
                        "bone", 
                        "Poland", 
                        "satin", 
                        "butter", 
                        "muffin", 
                        "milkshake",
                        "sword", 
                        "giant", 
                        "queen", 
                        "bear", 
                        "rainbow", 
                        "tornado", 
                        "lips", 
                        "carrot", 
                        "donut", 
                        "fraternity", 
                        "Salesforce", 
                        "trophy", 
                        "penguin",  
                        "shake weight", 
                        "snuggie",
                        "bacon",
                        "explosion"
                      ]
        name = rubric_list.sample + " " + rubric_list.sample
        phrase = ["The rubric is infallible", "Jumanji", "Unggggh", "Stop it", "Sigh", "SHAZAM!"].sample
        result = phrase + ": " + name
        return result
      end
           
      end
    end
  end