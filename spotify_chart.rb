require 'open-uri'
require 'json'

class SpotifyChart
  attr_reader :streamed, :shared

  def initialize(region_abbreviation)
    base_url = "http://charts.spotify.com/api/charts"
    @streamed = JSON.load(open("#{base_url}/most_streamed/#{region_abbreviation}/latest"))
    @shared = JSON.load(open("#{base_url}/most_shared/#{region_abbreviation}/latest"))
  end

  def most_streamed
    artist = streamed["tracks"][0]["artist_name"]
    track_title = streamed["tracks"][0]["track_name"] 
    album = streamed["tracks"][0]["album_name"] 
    "'#{track_title}' by '#{artist}' from the album '#{album}'"
  end

  def most_shared
    artist = shared["tracks"][0]["artist_name"]
    track_title = shared["tracks"][0]["track_name"] 
    album = shared["tracks"][0]["album_name"] 
    "'#{track_title}' by '#{artist}' from the album '#{album}'"
  end

end