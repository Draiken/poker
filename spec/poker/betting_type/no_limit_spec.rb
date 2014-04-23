require 'spec_helper'

module Poker
  describe NoLimit do

    let(:min) { 10 }
    subject { NoLimit.new(min) }

    describe "#min_raise" do
      it do
        expect(subject.min_raise).to eq min
      end
    end

    describe "#max_raise" do
      it do
        expect(subject.max_raise).to eq Float::INFINITY
      end
    end
  end
end
