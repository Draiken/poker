require 'spec_helper'

module Poker
  describe Table do

    let(:game) { double('a game') }
    let(:type) { double('a type') }
    let(:betting_type) { double('a betting type') }

    subject { Table.new(game: game,
                        type: type,
                        betting_type: betting_type) }

    describe "#deal_hole_cards" do
      it "delegates to the game" do
        hole_cards = double
        expect(game).to receive(:deal_hole_cards).and_return(hole_cards)
        expect(subject.deal_hole_cards).to eq hole_cards
      end
    end

    describe "#deal_board_cards" do
      it "delegates to the game" do
        board_cards = double
        expect(game).to receive(:deal_board_cards).and_return(board_cards)
        expect(subject.deal_board_cards).to eq board_cards
      end
    end

    describe "#min_raise" do
      it "delegates to the betting type" do
        expect(betting_type).to receive(:min_raise).and_return(1)
        expect(subject.min_raise).to eq 1
      end
    end

    describe "#max_raise" do
      it "delegates to the betting type" do
        expect(betting_type).to receive(:max_raise).and_return(1)
        expect(subject.max_raise).to eq 1
      end
    end
  end
end # Poker
