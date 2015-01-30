require 'spec_helper'

module Optimuss
  describe MultiplicationTable do
    context 'using a two dimensional array as presentation' do
      it 'returns a placeholder and the parameter collection as the first row' do
        collection = [1,2,3]
        table = MultiplicationTable.new(collection: collection)
        table.generate!
        expect(table.product.first).to eq([nil] + collection)
      end

      it 'returns a placeholder and the parameter collection as the first column' do
        collection = [1,2,3]
        table = MultiplicationTable.new(collection: collection)
        table.generate!
        first_column = table.product.map{|row|row.first}
        expect(first_column).to eq([nil] + collection)
      end

      it 'returns the multiplication of the row and column at the intersections' do
        collection = [1,2,3]
        table = MultiplicationTable.new(collection: collection)
        table.generate!
        expect(table.product[3][0]).to eq(3)
        expect(table.product[0][2]).to eq(2)
        expect(table.product[3][2]).to eq(6)
        expect(table.product[2][3]).to eq(6)
      end
    end
  end
end