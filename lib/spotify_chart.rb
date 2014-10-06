require 'json'
require 'open-uri'

class SpotifyChart

  attr_reader :base_url

  def initialize
    @base_url = "?"
  end

  def get_url(preference, region)
    # return a string that is the base url + / + preference + / + region + / + latest
  end

  def get_json(url)
    # load json given a url here
    # refer to the references if you have questions about this
  end

  def fetch_track_album_artist(music_hash)
    # given some json, this method should return a string like:
    # 'track name' by artist name from the album album name
   end

  def most_streamed(region)
    # call no get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable

    # call on get_json here, using the string that get_url returns
    
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
  end

  def most_shared(region)
    # call no get_url here, where preference is the string 'most_shared',
    # and set it equal to a variable

    # call on get_json here, using the string that get_url returns
    
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
  end

end
