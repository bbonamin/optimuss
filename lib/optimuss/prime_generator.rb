module Optimuss
  # Generates primes up to the given count
  # argument
  class PrimeGenerator
    def self.take(count: 1)
      primes = [2]
      return primes if count == 1
      wheels = []
      iterator = 3
      loop do
        if wheels.map(&:base_value).include?(iterator)
          wheels_to_update = wheels.select { |w| w.base_value == iterator }
          wheels_to_update.each(&:increment!)
        else
          primes << iterator
          wheels << Wheel.new(
            base_value: iterator * iterator,
            skip_value: iterator * 2
          )
        end
        iterator += 2
        break unless primes.size < count
      end
      primes
    end

    def self.at(position: raise(ArgumentError, 'position is required'))
      return 2 if position == 1
      primes = [2]
      wheels = []
      iterator = 3
      loop do
        if wheels.map(&:base_value).include?(iterator)
          wheels_to_update = wheels.select { |w| w.base_value == iterator }
          wheels_to_update.each(&:increment!)
        else
          primes << iterator
          wheels << Wheel.new(
            base_value: iterator * iterator,
            skip_value: iterator * 2
          )
        end
        iterator += 2
        break unless primes.size < position
      end
      primes[position - 1]
    end
  end
end
