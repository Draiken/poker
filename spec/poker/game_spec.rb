require 'spec_helper'

module Poker
  describe Game do

    it "initializes a default deck" do
      expect(subject.deck).to eq Deck.new
    end

    describe "#deal_board_cards" do
      it "draws 5 cards from the deck" do
        expect(subject.deal_board_cards.size).to eq 5
      end
    end
  end
end # Poker
