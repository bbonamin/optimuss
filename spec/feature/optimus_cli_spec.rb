require 'spec_helper'

describe 'Optimus CLI' do
  describe 'prime_table' do
    it 'runs and exits with a status 0' do
      expect(system 'bundle exec bin/optimuss prime_table').to eq(true)
    end

    it 'prints a multiplication table with the first 10 prime numbers' do
      output = `bundle exec bin/optimuss prime_table`
      table = primes_from_stdlib_multiplication_table
      unique_primes = output.gsub("\n", ' ').gsub(/[^\d|\s]/, '').split(' ').map(&:to_i).uniq
      control_primes = table.flatten.uniq
      expect(control_primes - unique_primes).to be_empty
    end
  end
end
