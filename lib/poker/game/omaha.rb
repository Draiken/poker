module Poker
  class Omaha < Game

    def name
      "Omaha"
    end

    def deal_hole_cards
      @deck.draw(4)
    end
    
  end
end # Poker
