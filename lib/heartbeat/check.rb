module Heartbeat
  class Check
    def initialize(url, request = Request, options = {})
      @request = request
      @options = options
      @url     = url
    end

    def pulse
      total_request_time = 0
      total_exec_time    = 0
      number_of_request  = 0
      
      begin
        start_time = Time.now

        @request.send(@url)

        request_seconds      = (Time.now - start_time).to_i
        total_exec_time     += request_seconds + interval
        total_request_time  += request_seconds

        sleep(interval)
        number_of_request += 1
      end while has_time?(total_exec_time)

      total_request_time / number_of_request
    end

    private
      def interval
        @options[:interval] || 10
      end

      def time_to_poll
        @options[:time_to_poll] || 60
      end

      def has_time?(total_exec_time)
        time_to_poll > total_exec_time
      end
  end
end