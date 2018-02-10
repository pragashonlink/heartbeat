
module Heartbeat
  class Check
    def initialize(request = Request, options = {})
      @request = request
      @options = options
    end

    def pulse(url)
      i = 0
      total_time_spent = 0

      begin
        start_time = Time.now

        @request.send(url)
        total_time_spent += Time.now - start_time

        sleep(1)
        i += 1        
      end while i < 5

      total_time_spent.to_i
    end

    def frequency
      @options[:frequency] || 10
    end

    def time_in_seonds
      @options[:in_seconds] || 60
    end

  end
end