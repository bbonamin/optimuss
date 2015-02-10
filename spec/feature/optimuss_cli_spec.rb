require 'spec_helper'

describe 'Optimuss CLI' do
  describe 'prime_table' do
    it 'runs and exits with a status 0' do
      expect(system 'bundle exec bin/optimuss prime_table').to eq(true)
    end

    it 'prints a multiplication table with the first 10 prime numbers' do
      output = `bundle exec bin/optimuss prime_table`
      table = primes_from_stdlib_multiplication_table(count: 10)
      control_primes = table.flatten.uniq

      unique_primes = numbers_from_stdout_table(output)
      expect((control_primes - unique_primes).compact).to be_empty
    end

    it 'prints a custom multiplication table if given an argument' do
      output = `bundle exec bin/optimuss prime_table --primes 20`
      control_primes = primes_from_stdlib_multiplication_table(count: 20)

      unique_primes = numbers_from_stdout_table(output)
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

  describe 'fib_table' do
    it 'runs and exits with a status 0' do
      expect(system 'bundle exec bin/optimuss fib_table').to eq(true)
    end

    it 'prints a fib multiplication table with the first 10 numbers' do
      output = `bundle exec bin/optimuss fib_table`
      control_fib_numbers = fib_numbers_from_helper
      unique_fib_numbers = numbers_from_stdout_table(output)
      expect((control_fib_numbers - unique_fib_numbers).compact).to be_empty
    end
  end
end
