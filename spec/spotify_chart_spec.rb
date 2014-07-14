require_relative 'spec_helper'
require 'pry'

describe SpotifyChart do

  let(:american_chart) {SpotifyChart.new("us")}
  let(:british_chart) {SpotifyChart.new("gb")}

  describe '#most_streamed' do

    before(:all) do
      encoded = "cmVxdWlyZSAnb3Blbi11cmknCnJlcXVpcmUgJ2pzb24nCgpjbGFzcyBTcGVj\nU3BvdGlmeUNoYXJ0CiAgYXR0cl9yZWFkZXIgOnN0cmVhbWVkLCA6c2hhcmVk\nCgogIGRlZiBpbml0aWFsaXplKHJlZ2lvbl9hYmJyZXZpYXRpb24pCiAgICBi\nYXNlX3VybCA9ICJodHRwOi8vY2hhcnRzLnNwb3RpZnkuY29tL2FwaS9jaGFy\ndHMiCiAgICBAc3RyZWFtZWQgPSBKU09OLmxvYWQob3BlbigiI3tiYXNlX3Vy\nbH0vbW9zdF9zdHJlYW1lZC8je3JlZ2lvbl9hYmJyZXZpYXRpb259L2xhdGVz\ndCIpKQogICAgQHNoYXJlZCA9IEpTT04ubG9hZChvcGVuKCIje2Jhc2VfdXJs\nfS9tb3N0X3NoYXJlZC8je3JlZ2lvbl9hYmJyZXZpYXRpb259L2xhdGVzdCIp\nKQogIGVuZAoKICBkZWYgbW9zdF9zdHJlYW1lZAogICAgYXJ0aXN0ID0gc3Ry\nZWFtZWRbInRyYWNrcyJdWzBdWyJhcnRpc3RfbmFtZSJdCiAgICB0cmFja190\naXRsZSA9IHN0cmVhbWVkWyJ0cmFja3MiXVswXVsidHJhY2tfbmFtZSJdIAog\nICAgYWxidW0gPSBzdHJlYW1lZFsidHJhY2tzIl1bMF1bImFsYnVtX25hbWUi\nXSAKICAgICInI3t0cmFja190aXRsZX0nIGJ5ICcje2FydGlzdH0nIGZyb20g\ndGhlIGFsYnVtICcje2FsYnVtfSciCiAgZW5kCgogIGRlZiBtb3N0X3NoYXJl\nZAogICAgYXJ0aXN0ID0gc2hhcmVkWyJ0cmFja3MiXVswXVsiYXJ0aXN0X25h\nbWUiXQogICAgdHJhY2tfdGl0bGUgPSBzaGFyZWRbInRyYWNrcyJdWzBdWyJ0\ncmFja19uYW1lIl0gCiAgICBhbGJ1bSA9IHNoYXJlZFsidHJhY2tzIl1bMF1b\nImFsYnVtX25hbWUiXSAKICAgICInI3t0cmFja190aXRsZX0nIGJ5ICcje2Fy\ndGlzdH0nIGZyb20gdGhlIGFsYnVtICcje2FsYnVtfSciCiAgZW5kCgplbmQ=\n"
      decoded = Base64.decode64(encoded)
      File.open('./spec/spec_spotify_chart.rb', 'w') do |file| 
        file.write(decoded)
      end
      require './spec/spec_spotify_chart.rb'
    end

    after(:all) do
      File.open('./spec/spec_spotify_chart.rb', 'w') do |file| 
        file.truncate(0)
      end
    end

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
