# frozen_string_literal: true

module Batting
  require 'csv'

  class Team
    def initialize(file)
      @team = {}

      load_and_prepare_data(file)
    end

    def find_by_id(id)
      team[id.to_sym]
    end

    private

    attr_reader :team

    def load_and_prepare_data(file)
      CSV.foreach(file, headers: true, col_sep: ',') do |row|
        team[row['teamID'].to_sym] = row['name']
      end
    end
  end
end
