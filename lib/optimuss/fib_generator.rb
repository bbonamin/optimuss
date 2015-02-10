module Optimuss
  class FibGenerator
    def self.take(count: 1)
      fail ArgumentError if count < 1
      count = Integer(count)
      (1..count).map { |n| fib(n) }
    end

    def self.fib(n)
      if n < 2
        n
      else
        fib(n - 1) + fib(n - 2)
      end
    end
  end
end
