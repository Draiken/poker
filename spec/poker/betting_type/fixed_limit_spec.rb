require 'spec_helper'

module Poker
  describe FixedLimit do

    let(:limit) { 10 }

    subject { FixedLimit.new(limit) }

    describe "#min_raise" do
      it do
        expect(subject.min_raise).to eq limit
      end
    end

    describe "#max_raise" do
      it do
        expect(subject.max_raise).to eq limit
      end
    end
  end
end
