module Poker
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
  end # RangeBettingType
end # Poker
