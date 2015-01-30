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
      wheels = []
      primes = [2]
      iterator = start_from
      loop do
        if wheels.map(&:base_value).include?(iterator)
          wheels.select { |w| w.base_value == iterator }.each(&:increment!)
        else
          primes << iterator
          wheels << Wheel.from(number: iterator)
        end
        iterator += 2
        break unless primes.size < max_count
      end
      primes
    end
  end
end
