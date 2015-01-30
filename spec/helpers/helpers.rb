require 'prime'

# RSpec related helpers
module Helpers
  def primes_from_stdlib_multiplication_table(count:)
    primes = Prime.take(count)
    table = []
    table << [nil] + primes
    primes.each do |prime|
      row = [prime] + primes.map { |m| m * prime }
      table << row
    end
    table
  end

  def numbers_from_stdout_table(output)
    output.to_s.gsub("\n", ' ').gsub(/[^\d]/, ' ').split(' ').map(&:to_i).uniq
  end
end
