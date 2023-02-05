# frozen_string_literal: true

require 'net/http'

# A Service that retrieves data from the given url using GET HTTP method.
class DataFetcher < Service
  def initialize(source_url)
    @url = source_url
  end

  def call
    fetch_data
  end

  private

  def fetch_data
    url = URI.parse @url
    Net::HTTP.get url
  end
end
