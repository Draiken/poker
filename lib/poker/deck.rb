module Poker
  class Deck
    SUITS = %w(d s h c).freeze

    attr_reader :cards

    def self.deck_cards(range = 2..14)
      [].tap do |cards|
        range.each do |n|
          Deck::SUITS.each do |suit|
            cards << "#{n}#{suit}" 
          end
        end
      end
    end

    def initialize(cards = Deck.deck_cards)
      @cards = cards
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
  end # Deck
end # Poker
