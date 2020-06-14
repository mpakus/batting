# frozen_string_literal: true

class Table
  require 'terminal-table'

  def initialize(results)
    @results = results
  end

  def print
    head = ['playerID', 'yearId', 'Team name(s)', 'Batting Average']

    table = Terminal::Table.new(headings: head) do |t|
      results.each do |row|
        name, year, teams, ba = row
        t << [name, year, teams&.join(', '), ba]
      end
    end

    puts table
  end

  private

  attr_reader :results
end
