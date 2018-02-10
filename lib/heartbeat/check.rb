require 'net/http'

module Heartbeat
  class Check
    def initialize(url)
      @url = url
    end

    def pulse
      i = 0
      total_time_spent = 0

      begin
        start_time = Time.now

        Net::HTTP.get(URI.parse(@url))
        total_time_spent += Time.now - start_time

        sleep(1)
        i += 1        
      end while i < 5

      total_time_spent
    end

    def frequency
      10
    end

    def time_in_seonds
      60
    end

  end
end