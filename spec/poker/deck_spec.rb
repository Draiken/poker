require 'spec_helper'

module Poker
  describe Deck do
    describe "#build_cards" do
      it "contains all cards and suits" do
        cards = subject.build_cards(2..14)
        (2..14).each do |n|
          Deck::SUITS.each do |suit|
            expect(cards).to include "#{n}#{suit}"
          end
        end
      end
    end

    describe "#draw" do
      it "draws n cards" do
        expect(subject.draw(2).size).to eq 2
      end

      it "removes the cards from the pool" do
        drawn_cards = subject.draw(2)

        expect(subject.cards).to_not include drawn_cards
      end
    end
  end
end # Poker
