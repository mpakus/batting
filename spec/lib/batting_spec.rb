# frozen_string_literal: true

require_relative '../../lib/batting'

RSpec.describe Batting do
  let(:options) { {} }
  let(:result) { described_class.performance(options) }

  context 'without params' do
    let(:snapshot) do
      [
        ['fergu', 1872, ['Brooklyn Atlantics', 'New York Mutuals'], 0.289],
        ['fisher', 1873, ['Philadelphia Athletics'], 0.261],
        ['fergu', 1874, ['Brooklyn Atlantics'], 0.261],
        ['fergu', 1873, ['Brooklyn Atlantics'], 0.259],
        ['fergu', 1871, ['New York Mutuals'], 0.241],
        ['fergu', 1875, ['Hartford Dark Blues'], 0.24],
        ['fisher', 1875, ['Philadelphia Whites'], 0.232],
        ['fisher', 1874, ['Hartford Dark Blues'], 0.224],
        ['field', 1872, ['Middletown Mansfields'], 0.221],
        ['field', 1875, ['Philadelphia Centennials', 'Washington Nationals'], 0.202]
      ]
    end

    it { expect(result.count).to eq 10 }
    it { expect(result).to match snapshot }
  end

  context 'with year filter' do
    let(:options) { { year: 1875 } }

    let(:snapshot) do
      [
        ['fergu', 1875, ['Hartford Dark Blues'], 0.24],
        ['fisher', 1875, ['Philadelphia Whites'], 0.232],
        ['field', 1875, ['Philadelphia Centennials', 'Washington Nationals'], 0.202]
      ]
    end

    it { expect(result.count).to eq 3 }
    it { expect(result).to match snapshot }
  end

  context 'with team name filter' do
    let(:options) { { team: 'Brooklyn Atlantics' } }

    let(:snapshot) do
      [
        ['fergu', 1872, ['Brooklyn Atlantics'], 0.28],
        ['fergu', 1874, ['Brooklyn Atlantics'], 0.261],
        ['fergu', 1873, ['Brooklyn Atlantics'], 0.259]
      ]
    end

    it { expect(result.count).to eq 3 }
    it { expect(result).to match snapshot }
  end

  context 'with year and team name filter' do
    let(:options) { { team: 'Brooklyn Atlantics', year: 1873 } }

    let(:snapshot) do
      [
        ['fergu', 1873, ['Brooklyn Atlantics'], 0.259]
      ]
    end

    it { expect(result.count).to eq 1 }
    it { expect(result).to match snapshot }
  end
end
