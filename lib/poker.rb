#require 'poker/table'
#

module Poker
  
  class Table
    attr_reader :type, :game, :betting_type

    def initialize(opts)
      @type         = opts.fetch(:type)
      @game         = opts.fetch(:game)
      @betting_type = opts.fetch(:betting_type)
    end

    def deal_hole_cards
      @game.deal_hole_cards
    end

    def deal_board_cards
      @game.deal_board_cards
    end

    def max_raise
      @betting_type.max_raise
    end

    def min_raise
      @betting_type.min_raise
    end
  end


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
  end # Deck

  class Game
    attr_accessor :deck

    def initialize
      @deck = Deck.new 
    end

    def deal_board_cards
      @deck.draw(5)
    end
    
  end # Game

  class Omaha < Game

    def deal_hole_cards
      @deck.draw(4)
    end
    
  end

  class Holdem < Game

    def deal_hole_cards
      @deck.draw(2)
    end
    
  end

  class Royal < Game

    def initialize
      @deck = Deck.new(Deck.deck_cards(10..14))
    end

    def deal_hole_cards
      @deck.draw(2)
    end
    
  end

  class RangeBettingType
    attr_reader :range

    def initialize(range)
      @range = range
    end
    
    def min_raise
      range.min
    end

    def max_raise
      range.max
    end
  end # BettingType

  class NoLimit < RangeBettingType
    # I assume here, we're using ruby >= 1.9
    def initialize(min = 1)
      super(min..Float::INFINITY)
    end
  end

  class PotLimit < RangeBettingType
    def initialize(pot_size, min = 1)
      super(min..pot_size)
    end
  end # PotLimit

  class FixedLimit
    def initialize(limit)
      @limit = limit
    end

    def min_raise
      @limit
    end

    def max_raise
      @limit
    end
  end # FixedLimit

end # Poker
