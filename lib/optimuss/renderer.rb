require 'terminal-table'

module Optimuss
  class Renderer
    def render(table: )
      Terminal::Table.new(rows: table)
    end
  end
end