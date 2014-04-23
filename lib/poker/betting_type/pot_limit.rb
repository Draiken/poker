require 'poker/betting_type/range_betting_type'

module Poker
  class PotLimit < RangeBettingType
    def initialize(pot_size, min = 1)
      super(min..pot_size)
    end
  end # PotLimit
end # Poker
