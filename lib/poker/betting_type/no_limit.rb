require 'poker/betting_type/range_betting_type'

module Poker
  class NoLimit < RangeBettingType
    # I assume here, we're using ruby >= 1.9
    def initialize(min = 1)
      super(min..Float::INFINITY)
    end

    def name
      "No Limit"
    end
  end
end # Poker
