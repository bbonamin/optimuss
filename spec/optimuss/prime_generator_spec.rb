require 'spec_helper'

module Optimuss
  describe PrimeGenerator do
    describe '.take' do
      it 'returns the take prime when called' do
        expect(PrimeGenerator.take).to eq([2])
      end

      it 'returns the take 2 primes when passed 2 as argument' do
        expect(PrimeGenerator.take(count: 2)).to eq([2, 3])
      end

      it 'returns the take 25 primes when passed 25 as argument' do
        expect(PrimeGenerator.take(count: 25)).to eq(Prime.take(25))
      end

      it 'returns the take 300 primes when passed 300 as argument' do
        expect(PrimeGenerator.take(count: 300)).to eq(Prime.take(300))
      end
    end

    describe '.at' do
      it 'raises an exception if position is not provided' do
        expect { PrimeGenerator.at }.to raise_error(ArgumentError)
      end
      it 'returns 2 as the prime number in the first position' do
        expect(PrimeGenerator.at position: 1).to eq(2)
      end

      it 'returns 29 as the prime number in the 10th position' do
        expect(PrimeGenerator.at position: 10).to eq(29)
      end
    end
  end
end
