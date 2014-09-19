require 'rubygems'
require 'test/unit'
require 'vcr'

# spec/support/vcr_setup.rb
VCR.configure do |c|
  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/vcr_cassettes'
  # your HTTP request service. You can also use fakeweb, webmock, and more
  c.hook_into :webmock
end

class VCRTest < Test::Unit::TestCase
  def test_example_dot_com
    VCR.use_cassette('synopsis') do
      response = Net::HTTP.get_response(URI('http://www.iana.org/domains/example/'))
      assert_match /Example Domains/, response.body
    end
  end
end 