RSpec.describe Heartbeat, "check average site performacne" do
  context "when the site is available" do
    it "should return a numeric value representing the time" do
     stub_request(:get, "https://t.lever-analytics.com/email-link?dest=https://gitlab.com&eid=17b181e8-271a-4c7e-a909-931a1abe2590&idx=0&token=g_K_AKBfcUMc5kjRdDzmtS2yHtY").
       with(  headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Host'=>'t.lever-analytics.com',
        'User-Agent'=>'Ruby'
         }).
       to_return(status: 200, body: "", headers: {})
      
      url       = 'https://t.lever-analytics.com/email-link?dest=https%3A%2F%2Fgitlab.com&eid=17b181e8-271a-4c7e-a909-931a1abe2590&idx=0&token=g_K_AKBfcUMc5kjRdDzmtS2yHtY'
      heartbeat = Heartbeat::Check.new(url)

      expect(heartbeat.pulse).to be_a(Numeric)
    end
  end
end
