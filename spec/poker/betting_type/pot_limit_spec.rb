require 'spec_helper'

module Poker
  describe PotLimit do

    let(:min) { 10 }
    let(:pot_size) { 20 }

    subject { PotLimit.new(pot_size, min) }

    describe "#min_raise" do
      it do
        expect(subject.min_raise).to eq min
      end
    end

    describe "#max_raise" do
      it do
        expect(subject.max_raise).to eq pot_size
      end
    end
  end
end
