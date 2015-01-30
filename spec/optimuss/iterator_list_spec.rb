require 'spec_helper'

module Optimuss
  describe IteratorList do
    let(:iterator) { Iterator.new(base_value: 2, skip_value: 1) }

    describe '#<<' do
      it 'appends an iterator to its list' do
        subject << iterator
        expect(subject.members.size).to eq(1)
        expect(subject.members.first.base_value).to eq(2)
        expect(subject.members.first.skip_value).to eq(1)
      end
    end

    describe '#contains?' do
      it 'returns true if contains an iterator' do
        subject << iterator
        expect(subject.contains? 2).to eq(true)
      end

      it 'returns false if it does not contain an iterator' do
        expect(subject.contains? 99).to eq(false)
      end
    end

    describe '#increment_members_with_base_value!' do
      let!(:base_value) { 10 }
      let!(:skip_value) { 5 }
      let(:iterator) do
        Iterator.new(base_value: base_value, skip_value: skip_value)
      end

      it 'moves the iterator to the next skip value' do
        subject << iterator
        subject.increment_members_with_base_value!(base_value)
        expect(subject.members.first.base_value).to eq(base_value + skip_value)
        expect(subject.members.first.skip_value).to eq(skip_value)
      end

      it 'moves all iterators to the next skip value' do
        other_skip_value = 7
        subject << iterator
        subject << Iterator.new(
                    base_value: base_value, \
                    skip_value: other_skip_value
                  )
        subject.increment_members_with_base_value!(base_value)
        expect(subject.members.first.base_value).to eq(base_value + skip_value)
        expect(subject.members.last.base_value
          ).to eq(base_value + other_skip_value)
      end
    end
  end
end
