module Poker
  class Holdem < Game

    def deal_hole_cards
      @deck.draw(2)
    end
    
  end
end # Poker
