require 'spec_helper'

module Optimuss
  describe Wheel do
    it 'stores a base value and a skip value' do
      wheel = Wheel.new(base_value: 1, skip_value: 2)
      expect(wheel.base_value).to eq(1)
      expect(wheel.skip_value).to eq(2)
    end

    describe '#increment!' do
      it 'updates the base value by adding the skip value' do
        subject = Wheel.new(base_value: 4, skip_value: 2)
        subject.increment!
        expect(subject.base_value).to eq(6)
      end
    end
  end
end
