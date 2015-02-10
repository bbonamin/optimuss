require 'spec_helper'

module Optimuss
  describe FibGenerator do
    describe '.take' do
      it 'returns the first number if fib series when called' do
        expect(FibGenerator.take).to eq([1])
      end

      it 'returns the first 10 fib numbers when called with a 10' do
        expect(
          FibGenerator.take(count: 10)
        ).to eq(Helpers::FIRST_10_FIB)
      end

      it 'raises an exception if you pass a negative number' do
        expect do
          FibGenerator.take(count: -1)
        end.to raise_error(ArgumentError)
      end
    end
  end
end
