require 'prime'

# RSpec related helpers
module Helpers
  FIRST_10_FIB = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

  def primes_from_stdlib_multiplication_table(count:)
    primes = Prime.take(count)
    multiply(primes).flatten.uniq
  end

  def numbers_from_stdout_table(output)
    output.to_s.gsub("\n", ' ').gsub(/[^\d]/, ' ').split(' ').map(&:to_i).uniq
  end

  def fib_numbers_from_helper(count:10)
    fib = FIRST_10_FIB if count == 10
    multiply(fib).flatten.uniq
  end

  def multiply(collection)
    table = []
    table << [nil] + collection
    collection.each do |i|
      row = [i] + collection.map { |m| m * i }
      table << row
    end
    table
  end
end
