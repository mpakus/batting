# frozen_string_literal: true

require_relative './src/performance'

module Batting
  require 'logger'

  DATA_FOLDER  = ENV['BATTING'] == 'test' ? 'spec/fixtures/' : 'data/'
  TEAMS_FILE   = DATA_FOLDER + 'Teams.csv'
  PLAYERS_FILE = DATA_FOLDER + 'Batting.csv'
  LOG_FILE     = 'logs/batting.log'

  def self.performance(options = {})
    logger = Logger.new(File.open(Batting::LOG_FILE, File::CREAT | File::APPEND))

    Batting::Performance
      .new(logger)
      .perform(options)
  end
end
