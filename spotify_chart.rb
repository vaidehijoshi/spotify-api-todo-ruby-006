require 'open-uri'
require 'json'
require 'pry'

class SpotifyChart
  attr_reader :base_url

  def initialize
    @base_url = "http://charts.spotify.com/api/charts/"
  end

  def get_url(version, region)
    base_url + version + "/" + region  + "/latest"
  end

  def get_json(url)
    JSON.load(open(url))
  end

  def fetch_track_album_artist(json)
    song = json["tracks"][0]
    "'#{song["track_name"]}' by #{song["artist_name"]} from the album #{song["album_name"]}"
  end

  def most_streamed(region)
    json = get_json(get_url("most_streamed", region))
    fetch_track_album_artist(json)
  end

  def most_shared(region)
    json = get_json(get_url("most_shared", region))
    fetch_track_album_artist(json)
  end

end
