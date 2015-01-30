module Optimuss
  class MultiplicationTable
    attr_reader :product

    def initialize(collection:)
      @collection = collection
    end

    def generate!
      header = [nil].concat(@collection)
      @product = [header].concat(
        @collection.map { |item|
          [item].concat(
            @collection.map { |inner_item| 
              inner_item * item
            }
          )
        }
      )
    end
  end
end