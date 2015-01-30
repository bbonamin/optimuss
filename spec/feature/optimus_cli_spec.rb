require 'spec_helper'

describe 'Optimus CLI' do
  describe 'prime_table' do
    it 'runs and exits with a status 0' do
      expect(system 'bundle exec bin/optimuss prime_table').to eq(true)
    end

    it 'prints a multiplication table with the first 10 prime numbers' do
      output = `bundle exec bin/optimuss prime_table`
      table = primes_from_stdlib_multiplication_table
      unique_primes = numbers_from_stdout_table(output)
      control_primes = table.flatten.uniq
      expect((control_primes - unique_primes).compact).to be_empty
    end
  end

  describe 'prime_at' do
    it 'runs and exits with a status 0' do
      command = 'bundle exec bin/optimuss prime_at --position 20'
      expect(system(command)).to eq(true)
    end

    it 'prints the prime at the given position if provided' do
      output = `bundle exec bin/optimuss prime_at --position 20`
      expect(output.split(' ').map(&:to_i).flatten.uniq).to include(71)
    end
  end
end
