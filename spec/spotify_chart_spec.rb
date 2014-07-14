require_relative 'spec_helper'

describe SpotifyChart do

  let(:american_chart) {SpotifyChart.new("us")}

  describe '#most_streamed' do
    it "returns the track title, artist, and album for a given country's top streamed song" do
      expect(american_chart.most_streamed).to eq(SpecSpotifyChart.new("us").most_streamed)
    end
    it "returns the track title, artist, and album for a given country's top shared song" do
      expect(american_chart.most_shared).to eq(SpecSpotifyChart.new("us").most_shared)
    end
  end

end
