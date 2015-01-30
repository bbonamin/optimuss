require 'terminal-table'

module Optimuss
  # Returns a puts compliant pretty
  # version of the argument table
  class Renderer
    def render(table:)
      Terminal::Table.new(rows: table)
    end
  end
end
