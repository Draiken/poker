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
end # Poker
