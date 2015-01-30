require 'spec_helper'

module Optimuss
  describe Iterator do
    it 'stores a base value and a skip value' do
      iterator = Iterator.new(base_value: 1, skip_value: 2)
      expect(iterator.base_value).to eq(1)
      expect(iterator.skip_value).to eq(2)
    end

    describe '#increment!' do
      it 'updates the base value by adding the skip value' do
        subject = Iterator.new(base_value: 4, skip_value: 2)
        subject.increment!
        expect(subject.base_value).to eq(6)
      end
    end

    describe '.from' do
      it 'sets up a proper iterator given just a number' do
        iterator = Iterator.from(number: 3)
        expect(iterator.base_value).to eq(9)
        expect(iterator.skip_value).to eq(6)
      end
    end
  end
end
