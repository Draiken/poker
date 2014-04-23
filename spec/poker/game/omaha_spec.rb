require 'spec_helper'

module Poker
  describe Omaha do
    describe "#deck" do
      it "containts all cards" do
        cards = subject.deck.cards

        expect(cards.size).to eq(13 * 4) 

        (2..14).each do |n|
          Deck::SUITS.each do |suit|
            expect(cards).to include "#{n}#{suit}"
          end
        end
      end
    end

    describe "#draw_hole_cards" do
      it "draws 4 cards" do
        expect(subject.deal_hole_cards.size).to eq 4
      end
    end
  end
end # Poker
