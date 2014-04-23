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
        expect(game).to receive(:deal_hole_cards)

        subject.deal_hole_cards
      end
    end

    describe "#deal_board_cards" do
      it "delegates to the game" do
        expect(game).to receive(:deal_board_cards)

        subject.deal_board_cards
      end
    end

    describe "#min_raise" do
      it "delegates to the betting type" do
        expect(betting_type).to receive(:min_raise)

        subject.min_raise
      end
    end

    describe "#max_raise" do
      it "delegates to the betting type" do
        expect(betting_type).to receive(:max_raise)

        subject.max_raise
      end
    end
  end
end # Poker
