describe SpotifyChart do
  # test spec setup
  let(:test_us_chart) { SpecSpotifyChart.new("us") }
  let(:test_gb_chart) { SpecSpotifyChart.new("gb") }
  # your file spec setup
  let(:spotify_chart) { SpotifyChart.new }

  describe '#most_streamed' do
    it "returns America's most streamed track title, artist, and album" do
      expect(spotify_chart.most_streamed("us")).to eq(test_us_chart.most_streamed)
    end

    it "returns Great Britain's most streamed track title, artist, and album" do
      expect(spotify_chart.most_streamed("gb")).to eq(test_gb_chart.most_streamed)
    end
  end

  describe '#most_shared' do
    it "returns America's most shared track title, artist, and album" do
      expect(spotify_chart.most_shared("us")).to eq(test_us_chart.most_shared)
    end

    it "returns Great Britain's most shared track title, artist, and album" do
      expect(spotify_chart.most_shared("gb")).to eq(test_gb_chart.most_shared)
    end
  end

end