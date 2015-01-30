module Optimuss
  class Iterator
    attr_accessor :base_value, :skip_value

    def self.from(number:)
      new(base_value: number * number, skip_value: number * 2)
    end

    def initialize(base_value:, skip_value:)
      @base_value = base_value
      @skip_value = skip_value
    end

    def increment!
      @base_value += @skip_value
    end
  end
end
