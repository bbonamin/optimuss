module Optimuss
  class IteratorList
    attr_reader :members

    def initialize
      @members = []
    end

    def <<(iterator)
      @members << iterator
    end

    def contains?(base_value)
      @members.map(&:base_value).include?(base_value)
    end

    def increment_members_with_base_value!(base_value)
      @members.select { |w| w.base_value == base_value }.each(&:increment!)
    end
  end
end
