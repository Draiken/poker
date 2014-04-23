require 'poker/deck'

module Poker
  class Game
    attr_accessor :deck

    def initialize
      @deck = Deck.new 
    end

    def deal_board_cards
      @deck.draw(5)
    end
    
  end # Game
end # Poker

require 'poker/game/omaha'
require 'poker/game/holdem'
require 'poker/game/royal'
