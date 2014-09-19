require 'open-uri'
require 'json'

class SpotifyChart
  attr_reader :streamed, :shared

  def initialize(region_abbreviation)
    base_url = "http://charts.spotify.com/api/charts"
    @streamed = JSON.load(open("#{base_url}/most_streamed/#{region_abbreviation}/latest"))
    @shared = JSON.load(open("#{base_url}/most_shared/#{region_abbreviation}/latest"))
  end

  def fetch_track_album_artist(json)
    song = json["tracks"][0]
    "'#{song["track_name"]}' by '#{song["artist_name"]}' from the album '#{song["album_name"]}'"
  end

  def most_streamed
    fetch_track_album_artist(streamed)
  end

  def most_shared
    fetch_track_album_artist(shared)
  end

end