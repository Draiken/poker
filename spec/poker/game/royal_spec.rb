require 'spec_helper'

module Poker
  describe Royal do
    it "containts 10..14 cards" do
      cards = subject.deck.cards

      expect(cards.size).to eq(5 * 4) 

      (10..14).each do |n|
        Deck::SUITS.each do |suit|
          expect(cards).to include "#{n}#{suit}"
        end
      end
    end

    describe "#deal_hole_cards" do
      it "draws 2 cards" do
        expect(subject.deal_hole_cards.size).to eq 2
      end
    end
  end
end
