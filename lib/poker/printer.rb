#encoding: utf-8
module Poker
  class Printer
    attr_reader :table, :output

    def initialize(table, output = STDOUT)
      @table = table
      @output = output
    end

    # I could use a presenter/decorator to add the name for the
    # game and the betting type, but for this exercise I decided
    # to just add the name method to the classes
    def print
      output.write <<-EOS
#{@table.game.name} Poker table with #{@table.betting_type.name}
Table type:  #{table_type}
Deck:        #{deck_cards}
Hole Cards:  #{hole_cards}
Board Cards: #{board_cards}
Min Raise:   #{@table.min_raise}
Max Raise:   #{@table.max_raise}
EOS
    end

    # MTT and Ring would probably become classes as the system evolves
    def table_type
      case @table.type
      when "mtt"
        "Multi Table Tournaments"
      when "ring"
        "Ring Games"
      end
    end

    def deck_cards
      print_cards(@table.game.deck.cards)
    end

    def hole_cards
      print_cards(@table.deal_hole_cards)
    end

    def board_cards
      print_cards(@table.deal_board_cards)
    end

    def print_cards(cards)
      cards.map{|c| Card.new(c) }.map(&:to_s).join(", ")
    end

    class Card

      SUIT_SYMBOLS = {
        "s" => "♠",
        "c" => "♣",
        "h" => "♥",
        "d" => "♦"
      }

      RANK_SYMBOLS = {
        11 => "J",
        12 => "Q",
        13 => "K",
        14 => "A"
      }

      def initialize(card)
        @rank = card[0, card.length - 1].to_i
        @suit = card[card.length - 1, 1]
      end

      def to_s
        "%s%s" % [rank_symbol, suit_symbol]
      end

      def suit_symbol
        SUIT_SYMBOLS[@suit]
      end

      def rank_symbol
        case @rank
        when 2..10
          @rank
        else
          RANK_SYMBOLS[@rank]
        end
      end
    end
  end # Printer
end # Poker
