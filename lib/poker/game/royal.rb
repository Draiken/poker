module Poker
  class Royal < Game

    def initialize
      @deck = Deck.new(10..14)
    end

    def name
      "Royal Hold'em"
    end

    def deal_hole_cards
      @deck.draw(2)
    end
    
  end
end # Poker
