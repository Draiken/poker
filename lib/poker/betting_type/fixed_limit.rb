module Poker
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
