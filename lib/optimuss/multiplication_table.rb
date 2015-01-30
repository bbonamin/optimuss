module Optimuss
  class MultiplicationTable
    attr_reader :product

    def initialize(collection:)
      @collection = collection
    end

    # Calculates the product of all the possible combinations
    # between the collection
    def generate!
      header = [nil].concat(@collection)
      @product = [header].concat(
        @collection.map do |item|
          [item].concat(
            @collection.map do |inner_item|
              inner_item * item
            end
          )
        end
      )
    end
  end
end
