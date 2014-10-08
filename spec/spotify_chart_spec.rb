describe SpotifyChart do

  describe '#initialize' do
    it "does not raise error when called on with no arguments" do
      expect { SpotifyChart.new }.to_not raise_error
    end

    it "sets a constant 'base_url' as the root url of the Spotify Chart API" do
      expect(SpotifyChart::BASE_URL).to eq("http://charts.spotify.com/api/tracks/")
    end
  end

  let(:spotify_chart) { SpotifyChart.new }

  describe "#get_url" do
    it "- accepts two arguments, most_streamed/most_shared and region" do
      expect { spotify_chart.get_url("most_streamed", "us") }.to_not raise_error
    end

    let(:us_most_shared)   { spotify_chart.get_url("most_shared",   "us") }
    let(:gb_most_streamed) { spotify_chart.get_url("most_streamed", "gb") }

    it "- returns a string" do
      expect(us_most_shared.class).to eq(String)
    end

    it "- returns a string with the base url
      followed by a slash
      then the first argument
      followed by a slash
      then the second argument
      followed by a slash
      ending with 'weekly/latest'                        " do

      regex = /http:\/\/charts.spotify.com\/api\/tracks\/most_streamed\//
      regex_results = [regex.match(gb_most_streamed), /\/weekly\/latest/.match(gb_most_streamed), /gb/.match(gb_most_streamed)]
      regex_results.each do |match|
        expect(match).to_not be_nil
      end

      regex = /http:\/\/charts.spotify.com\/api\/tracks\/most_shared\//
      regex_results = [regex.match(us_most_shared), /\/weekly\/latest/.match(us_most_shared), /us/.match(us_most_shared)]
      regex_results.each do |match|
        expect(match).to_not be_nil
      end
    end

    it "- returns the correct url for querying the API based on 
      most shared/streamed and region abbreviation" do
      expect(gb_most_streamed).to eq("http://charts.spotify.com/api/tracks/most_streamed/gb/weekly/latest")
      expect(us_most_shared).to eq("http://charts.spotify.com/api/tracks/most_shared/us/weekly/latest")
    end
  
  end

  describe "#get_json" do
    let(:url) { "http://api.openweathermap.org/data/2.5/weather?q=NewYork" }
    
    it "accepts one argument, a JSON url" do
      expect { spotify_chart.get_json(url) }.to_not raise_error
    end

    it "returns a hash" do
      expect(spotify_chart.get_json(url).class).to eq(Hash)
    end

    it "is the Ruby Hash version of JSON from a url" do
      expect(spotify_chart.get_json(url)).to eq(JSON.load(open(url)))
    end
  end

  describe "#fetch_track_album_artist" do
     
    let(:us_most_streamed) { JSON.parse( IO.read("spec/support/us_most_streamed.json")) }
    
    it "accepts one argument, a hash object" do
      expect { spotify_chart.fetch_track_album_artist(us_most_streamed) }.to_not raise_error
    end

    it "returns a string" do
      expect(spotify_chart.fetch_track_album_artist(us_most_streamed).class).to eq(String)
    end

    it "returns '<song>' by <artist> from the album <album>" do
      expect(spotify_chart.fetch_track_album_artist(us_most_streamed)).to eq("'All About That Bass' by Meghan Trainor from the album Title")
    end
  end

  describe '#most_streamed' do

    it "accepts one argument, the region" do
      expect { spotify_chart.most_streamed("us") }.to_not raise_error
    end

    it "returns America's most streamed track title, artist, and album" do
      # subbing out get_json method so that test can predict result
      class SpotifyChart
        def get_json(arg)
          JSON.parse( IO.read("spec/support/us_most_streamed.json"))
        end
      end
      expect(SpotifyChart.new.most_streamed("us")).to eq("'All About That Bass' by Meghan Trainor from the album Title")
    end

    it "returns Great Britain's most streamed track title, artist, and album" do
      # subbing out get_json method so that test can predict result
      class SpotifyChart
        def get_json(arg)
          JSON.parse( IO.read("spec/support/gb_most_streamed.json"))
        end
      end
      expect(SpotifyChart.new.most_streamed("gb")).to eq("'Prayer In C - Robin Schulz Radio Edit' by Lilly Wood from the album Prayer In C")
    end
  end

  describe '#most_shared' do
    it "accepts one argument, the region" do
      expect { spotify_chart.most_shared("us") }.to_not raise_error
    end

    it "returns America's most shared track title, artist, and album" do
      # subbing out get_json method so that test can predict result
      class SpotifyChart
        def get_json(arg)
          JSON.parse( IO.read("spec/support/us_most_shared.json"))
        end
      end
      expect(spotify_chart.most_shared("us")).to eq("'Shut Up and Dance' by WALK THE MOON from the album Shut Up and Dance")
    end

    it "returns Great Britain's most shared track title, artist, and album" do
      # subbing out get_json method so that test can predict result
      class SpotifyChart
        def get_json(arg)
          JSON.parse( IO.read("spec/support/gb_most_shared.json"))
        end
      end
      expect(spotify_chart.most_shared("gb")).to eq("'Never Catch Me (feat. Kendrick Lamar)' by Flying Lotus from the album Never Catch Me (feat. Kendrick Lamar)")
    end
  end

end