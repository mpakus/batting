# frozen_string_literal: true

require_relative 'team'

module Batting
  require 'csv'

  class Performance
    def initialize(logger = nil)
      @team   = Batting::Team.new(Batting::TEAMS_FILE)
      @logger = logger
    end

    def perform(options = {})
      @options = options
      results  = []
      buffer   = []
      last_row = {}

      CSV.foreach(Batting::PLAYERS_FILE, headers: true, col_sep: ',') do |row|
        next if filter_year && row['yearID'].to_i != filter_year.to_i
        next if filter_team && team.find_by_id(row['teamID']) != filter_team

        unless last_row.empty?
          if last_row['playerID'] != row['playerID'] || last_row['yearID'] != row['yearID']
            results << calculate(buffer)

            buffer = []
          end
        end

        last_row = row
        buffer << row
      end
      results << calculate(buffer)

      results.sort_by { |p| p[3] }.reverse!
    end

    private

    attr_reader :options, :team, :logger

    def filter_year
      @filter_year ||= options.fetch(:year, false)
    end

    def filter_team
      @filter_team ||= options.fetch(:team, false)
    end

    def calculate(buffer = [])
      return unless buffer.any?

      row   = buffer.first
      ba    = buffer.collect { |p| p['H'].to_f / (p['AB'].to_f <= 0 ? 1 : p['AB'].to_f) }.reduce(&:+) / buffer.count
      teams = buffer.collect { |p| find_team(p['teamID']) }.reject(&:nil?).uniq

      [
        row['playerID'],
        row['yearID'].to_i,
        teams,
        ba.round(3)
      ]
    end

    def find_team(id)
      team_name = team.find_by_id(id)
      logger.log("Can't find Team with ID #{id}") if team_name.empty? && logger

      team_name
    end
  end
end
