require 'prime'
module Helpers
  def primes_from_stdlib_multiplication_table
    primes = Prime.take(10)
    table = []
    table << [nil] + primes
    primes.each do |prime|
      row = []
      row = [prime] + primes.map {|m| m * prime}
      table << row
    end
    table
  end
end


