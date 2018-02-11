require 'net/http'

# The class which is called to make a request to a desired URL
# How to use the class
#
# Heartbeat::Request.send(URL)
#
# *URL
# The target Url which should receive the request
module Heartbeat
  class Request
    def self.send(url)
      Net::HTTP.get(URI.parse(url))
    end
  end
end