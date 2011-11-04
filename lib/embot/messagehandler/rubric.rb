module Embot
  module MessageHandler

    # Quote message handler
    #
    # This message handler will post a random quote from
    # www.quotationspage.com
    #
    # Triggers on command: embot quote
    class Rubric < Base
      def process(message)
        return nil if !message.is_for_embot? || !message.command_is?('rubric')
        speak(nameify)
      end

      private

      def nameify  
        rubric_list = %w(rocket laser	dinosaur	old people	tiger chicken	steel	crystal	engine	lady	baby	rhino	panda	apocalypse	zombie	ninja	harrison ford	space	underpants	future	robot	chocolate	shark	jet	gun	guitar solo	beard	sparkle	fire	monkey	cyber	fist	unicorn	mustache juice)
        name = rubric_list.sample + " " + rubric_list.sample
        return name
      end
           
      end
    end
  end