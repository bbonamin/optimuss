module Optimuss
  module PrimeGenerator
    def self.take(count: 1)
      return [2] if count == 1
      primes(pointer: 3, max_count: count)
    end

    def self.at(position: fail(ArgumentError, 'position is required'))
      return 2 if position == 1
      primes(pointer: 3, max_count: position).fetch(position - 1)
    end

    def self.primes(pointer:, max_count:)
      list = IteratorList.new
      primes = [2]
      loop do
        if list.contains?(pointer)
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
