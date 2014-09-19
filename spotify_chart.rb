require 'open-uri'
require 'json'

class SpotifyChart
  attr_reader :base_url
  attr_accessor :region, :version, :url

  def initialize
    @base_url = "http://charts.spotify.com/api/charts/"
    @region = ""
    @version = ""
  end

  def get_url
    base_url + version + "/" + region  + "/latest"
  end

  def get_json
    JSON.load(open(get_url))
  end

  def fetch_track_album_artist
    song = get_json["tracks"][0]
    "'#{song["track_name"]}' by '#{song["artist_name"]}' from the album '#{song["album_name"]}'"
  end

  def most_streamed(region)
    self.region = region
    self.version = "most_streamed"
    fetch_track_album_artist
  end

  def most_shared(region)
    self.region = region
    self.version = "most_shared"
    fetch_track_album_artist
  end

end