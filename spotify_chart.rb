require 'open-uri'
require 'json'

class SpotifyChart
  attr_reader :country_data

  def initialize(country_abbreviation)
    url = "http://charts.spotify.com/api/charts/most_streamed/"
    @country_data = JSON.load(open("#{url}#{country_abbreviation}/latest"))
  end

  def most_popular_song
    artist = country_data["tracks"][0]["artist_name"]
    track_title = country_data["tracks"][0]["track_name"] 
    album = country_data["tracks"][0]["album_name"] 
    "'#{track_title}'' by '#{artist}'' from the album '#{album}'"
  end

  #def most_popular_song

  #end

  def second_most_popular_songs_artist

  end

  def third_most_popular_songs_album

  end

end

my_chart = SpotifyChart.new("us")
puts my_chart.most_popular_song