require 'spec_helper'

module Optimuss
  describe PrimeGenerator do
    describe '.take' do
      it 'returns the take prime when called' do
        expect(PrimeGenerator.take).to eq([2])
      end

      it 'returns the take 2 primes when passed 2 as argument' do
        expect(PrimeGenerator.take(count: 2)).to eq([2,3])
      end

      it 'returns the take 25 primes when passed 25 as argument' do
        expect(PrimeGenerator.take(count: 25)).to eq(Prime.take(25))
      end

      it 'returns the take 300 primes when passed 300 as argument' do
        expect(PrimeGenerator.take(count: 300)).to eq(Prime.take(300))
      end
    end
  end
end