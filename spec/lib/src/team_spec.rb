# frozen_string_literal: true

require_relative '../../../lib/src/team'

RSpec.describe Batting::Team do
  let(:options) { {} }
  let(:team) { described_class.new(Batting::TEAMS_FILE) }

  it { expect(team.find_by_id('PH3')).to eq 'Philadelphia Centennials' }
  it { expect(team.find_by_id('MID')).to eq 'Middletown Mansfields' }
  it { expect(team.find_by_id('NY2')).to eq 'New York Mutuals' }
end
