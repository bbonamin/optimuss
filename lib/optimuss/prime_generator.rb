module Optimuss
  class PrimeGenerator
    def self.take(count: 1)
      primes = [2]
      return primes if count == 1
      wheels = []
      iterator = 3
      begin
        if wheels.map(&:base_value).include?(iterator)
          wheels_to_update = wheels.select{|w| w.base_value == iterator}
          wheels_to_update.each { |wheel| wheel.increment! }
        else
          primes << iterator
          wheels << Wheel.new(base_value: iterator*iterator, skip_value: iterator*2)
        end
        iterator +=2
      end while primes.size < count  
      primes
    end
  end

  class Wheel
    attr_accessor :base_value, :skip_value
    def initialize(base_value: , skip_value: )
      @base_value = base_value
      @skip_value = skip_value
    end

    def increment!
      @base_value += @skip_value
    end
  end
end