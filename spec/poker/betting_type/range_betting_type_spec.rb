require 'spec_helper'

module Poker
  describe RangeBettingType do

    let(:range) { 1..10 }

    subject { RangeBettingType.new(range) }

    describe "#min_raise" do
      it "returns the min from the range" do
        expect(subject.min_raise).to eq range.min
      end
    end

    describe "#max_raise" do
      it "returns the max from the range" do
        expect(subject.max_raise).to eq range.max
      end
    end
    
  end
end # Poker
