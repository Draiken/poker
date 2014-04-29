module Poker
  class Deck
    SUITS = %w(d s h c).freeze

    attr_reader :cards


    def initialize(range = 2..14)
      @cards = build_cards(range)
    end

    def draw(quantity)
      cards.sample(quantity).tap do |drawn_cards|
        @cards -= drawn_cards
      end
    end

    def ==(other)
      self.cards == other.cards
    end

    def to_s
      cards.to_s
    end

    def build_cards(range)
      range.inject([]) do |cards, number|
        Deck::SUITS.each do |suit|
          cards << "#{number}#{suit}" 
        end
        cards
      end
    end
  end # Deck
end # Poker
