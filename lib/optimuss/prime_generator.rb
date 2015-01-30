module Optimuss
  # Generates primes up to the given count
  module PrimeGenerator
    def self.take(count: 1)
      return [2] if count == 1
      primes(start_from: 3, max_count: count)
    end

    def self.at(position: fail(ArgumentError, 'position is required'))
      return 2 if position == 1
      primes(start_from: 3, max_count: position)[position - 1]
    end

    def self.primes(start_from:, max_count:)
      list = IteratorList.new
      primes = [2]
      pointer = start_from
      loop do
        if list.iterator?(pointer)
          list.increment_members_with_base_value!(pointer)
        else
          primes << pointer
          list << Iterator.from(number: pointer)
        end
        pointer += 2
        break unless primes.size < max_count
      end
      primes
    end
  end
end
