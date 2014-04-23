module Poker
  class Holdem < Game

    def name
      "Texas Hold'em"
    end

    def deal_hole_cards
      @deck.draw(2)
    end
    
  end
end # Poker
