require 'spec_helper'

module Optimuss
  describe Renderer do
    it 'implements a render method' do
      expect(subject).to respond_to(:render)
    end

    it 'prints the table passed as argument' do
      output = subject.render(table: [[1, 2], [3, 4]])
      table_items = numbers_from_stdout_table(output)
      control_items = [1, 2, 3, 4]
      expect(control_items - table_items).to be_empty
    end
  end
end
