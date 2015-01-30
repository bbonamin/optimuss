require 'spec_helper'

module Optimuss
  describe MultiplicationTable do
    context 'using a two dimensional array as presentation' do
      let!(:collection)  { [1, 2, 3] }
      let(:subject) { MultiplicationTable.new(collection: collection) }

      before(:each) { subject.generate! }

      it 'returns a placeholder and the collection as the first row' do
        expect(subject.product.first).to eq([nil] + collection)
      end

      it 'returns a placeholder and the collection as the first column' do
        first_column = subject.product.map(&:first)
        expect(first_column).to eq([nil] + collection)
      end

      it 'returns the multiplication of rows and columns at the intersection' do
        expect(subject.product[3][0]).to eq(3)
        expect(subject.product[0][2]).to eq(2)
        expect(subject.product[3][2]).to eq(6)
        expect(subject.product[2][3]).to eq(6)
      end
    end
  end
end
