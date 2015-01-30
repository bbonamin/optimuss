require 'spec_helper'

module Optimuss
  describe IteratorList do
    describe '#<<' do
      it 'appends an iterator to its list' do
        subject << Iterator.new(base_value: 2, skip_value: 1)
        expect(subject.members.size).to eq(1)
        expect(subject.members.first.base_value).to eq(2)
        expect(subject.members.first.skip_value).to eq(1)
      end
    end

    describe '#iterator?' do
      it 'returns true if contains an iterator' do
        subject << Iterator.new(base_value: 2, skip_value: 1)
        expect(subject.iterator? 2).to eq(true)
      end

      it 'returns false if it does not contain an iterator' do
        expect(subject.iterator? 99).to eq(false)
      end
    end

    describe '#increment_members_with_base_value!' do
      it 'moves the iterator to the next skip value' do
        base_value, skip_value = 10, 5
        subject << Iterator.new(base_value: base_value, skip_value: skip_value)
        subject.increment_members_with_base_value!(base_value)
        expect(subject.members.first.base_value).to eq(base_value + skip_value)
        expect(subject.members.first.skip_value).to eq(skip_value)
      end

      it 'moves all iterators to the next skip value' do
        base_value, skip_value, skip_value2 = 10, 5, 7
        subject << Iterator.new(base_value: base_value, skip_value: skip_value)
        subject << Iterator.new(base_value: base_value, skip_value: skip_value2)
        subject.increment_members_with_base_value!(base_value)
        expect(subject.members.first.base_value).to eq(base_value + skip_value)
        expect(subject.members.last.base_value).to eq(base_value + skip_value2)
      end
    end
  end
end
