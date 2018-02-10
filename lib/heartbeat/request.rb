require 'net/http'

module Heartbeat
  class Request
    def self.send(url)
      Net::HTTP.get(URI.parse(url))
    end
  end
end