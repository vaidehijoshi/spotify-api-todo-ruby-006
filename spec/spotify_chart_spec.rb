describe SpotifyChart do

  describe '#initialize' do
    it "does not raise error when called on with no arguments" do
      expect { SpotifyChart.new }.to_not raise_error
    end

    it "sets a variable 'base_url' as the root url of the Spotify Chart API" do
      expect(SpotifyChart.new.base_url).to eq("http://charts.spotify.com/api/charts/")
    end
  end

  let(:spotify_chart) { SpotifyChart.new }

  describe "#get_url" do
    it "accepts two arguments, most_streamed/most_shared and region" do
      expect { spotify_chart.get_url("most_streamed", "us") }.to_not raise_error
    end

    let(:us_most_shared)   { spotify_chart.get_url("most_shared",   "us") }
    let(:gb_most_streamed) { spotify_chart.get_url("most_streamed", "gb") }

    it "returns a string" do
      expect(us_most_shared.class).to eq(String)
    end

    it "- returns a string with the base url followed by 'most_streamed',
       including the region abbreviation,
       and ending with 'latest' when most streamed is queried" do
      regex = /http:\/\/charts.spotify.com\/api\/charts\/most_streamed\//
      regex_results = [regex.match(gb_most_streamed), /\/latest/.match(gb_most_streamed), /gb/.match(gb_most_streamed)]
      regex_results.each do |match|
        expect(match).to_not be_nil
      end
    end

    it "- returns a string with the base url followed by 'most_shared', 
       including the region abbreviation, 
       and ending with 'latest' when most shared is queried" do
      regex = /http:\/\/charts.spotify.com\/api\/charts\/most_shared\//
      regex_results = [regex.match(us_most_shared), /\/latest/.match(us_most_shared), /us/.match(us_most_shared)]
      regex_results.each do |match|
        expect(match).to_not be_nil
      end
    end

    it "returns the correct url for querying the API based on most shared/streamed and region abbreviation" do
      expect(gb_most_streamed).to eq("http://charts.spotify.com/api/charts/most_streamed/gb/latest")
      expect(us_most_shared).to eq("http://charts.spotify.com/api/charts/most_shared/us/latest")
    end
  
  end # get_url

  describe "#get_json" do
    let(:url) { "http://api.openweathermap.org/data/2.5/weather?q=NewYork" }
    
    it "accepts one argument, a JSON url" do
      expect { spotify_chart.get_json(url) }.to_not raise_error
    end

    it "returns a hash" do
      expect(spotify_chart.get_json(url).class).to eq(Hash)
    end

  end

  describe "#fetch_track_album_artist" do

    let(:song_json) { JSON.parse( IO.read("spec/support/example_api.json")) }
     
    it "accepts one argument, a hash object" do
      expect { spotify_chart.fetch_track_album_artist(song_json) }.to_not raise_error
    end

    it "returns a string" do
      expect(spotify_chart.fetch_track_album_artist(song_json).class).to eq(String)
    end

    it "returns '<song>' - by '<artist>' from the album '<album>'" do
      expect(spotify_chart.fetch_track_album_artist(song_json)).to eq("'All About That Bass' by 'Meghan Trainor' from the album 'Title'")
    end
  end

  # # test spec setup
  # let(:test_us_chart) { SpecSpotifyChart.new("us") }
  # let(:test_gb_chart) { SpecSpotifyChart.new("gb") }

  # describe '#most_streamed' do
  #   it "accepts one argument, the region" do
  #     expect { spotify_chart.most_streamed("us") }.to_not raise_error
  #   end

  #   it "returns America's most streamed track title, artist, and album" do
  #     expect(spotify_chart.most_streamed("us")).to eq(test_us_chart.most_streamed)
  #   end

  #   it "returns Great Britain's most streamed track title, artist, and album" do
  #     expect(spotify_chart.most_streamed("gb")).to eq(test_gb_chart.most_streamed)
  #   end
  # end

  # describe '#most_shared' do
  #   it "accepts one argument, the region" do
  #     expect { spotify_chart.most_shared("us") }.to_not raise_error
  #   end

  #   it "returns America's most shared track title, artist, and album" do
  #     expect(spotify_chart.most_shared("us")).to eq(test_us_chart.most_shared)
  #   end

  #   it "returns Great Britain's most shared track title, artist, and album" do
  #     expect(spotify_chart.most_shared("gb")).to eq(test_gb_chart.most_shared)
  #   end
  # end

end