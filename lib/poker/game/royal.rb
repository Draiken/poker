module Poker
  class Royal < Game
    def initialize
      @deck = Deck.new(Deck.deck_cards(10..14))
    end

    def deal_hole_cards
      @deck.draw(2)
    end
    
  end
end # Poker
