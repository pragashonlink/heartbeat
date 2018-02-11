# The main class of the library which should be called by passing in the following parameters
#
# Instantiate the Check class:
#
#   Heartbeat::Check.new(Url)
#
#   *. Url
#   The Url whose response time should be tested. For an example you could pass 
#   https://t.lever-analytics.com/email-link?dest=https://gitlab.com&eid=17b181e8-271a-4c7e-a909-931a1abe2590&idx=0&token=g_K_AKBfcUMc5kjRdDzmtS2yHtY
#
# Instantiate with a custom request dispatcher
# 
#   Heartbeat::Check.new(Url, {}, CustomRequest)
#
#   *. CustomRequest
#   The custom request dispatcher should have a class method named send that accepts a url
#
# Instantiate with a custom request dispatcher and options
#
#   Heartbeat::Check.new(Url, {interval: 5, time_to_poll: 25})
# 
#   *. Options[:interval]
#   The time interval between each request. The execution will sleep at this point
#   
#   *. Options[:time_to_poll]
#   For how long should the requests be made
# 
module Heartbeat
  class Check
    def initialize(url, options = {}, request = Request)
      @url     = url      
      @options = options || {}
      @request = request || Request      
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