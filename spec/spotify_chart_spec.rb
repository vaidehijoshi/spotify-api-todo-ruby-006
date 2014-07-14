require_relative 'spec_helper'

describe SpotifyChart do

  let(:american_chart) {SpotifyChart.new("us")}
  let(:british_chart) {SpotifyChart.new("gb")}

  describe '#most_streamed' do
    it "returns America's most streamed track title, artist, and album" do
      expect(american_chart.most_streamed).to eq(SpecSpotifyChart.new("us").most_streamed)
    end
    it "returns America's most shared track title, artist, and album" do
      expect(american_chart.most_shared).to eq(SpecSpotifyChart.new("us").most_shared)
    end
    it "returns Great Britain's most streamed track title, artist, and album" do
      expect(british_chart.most_streamed).to eq(SpecSpotifyChart.new("gb").most_streamed)
    end
    it "returns Great Britain's most shared track title, artist, and album" do
      expect(british_chart.most_shared).to eq(SpecSpotifyChart.new("gb").most_shared)
    end
  end

end
