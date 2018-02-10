RSpec.describe Heartbeat, "check average site performacne" do
  context "when the site is available" do
    it "should return a numeric value representing the time" do
      url = "https://t.lever-analytics.com/email-link?dest=https://gitlab.com&eid=17b181e8-271a-4c7e-a909-931a1abe2590&idx=0&token=g_K_AKBfcUMc5kjRdDzmtS2yHtY"

      heartbeat = Heartbeat::Check.new(Spec::Request)

      expect(heartbeat.pulse(url)).to be_a(Numeric)
    end

    it "should return the time taken to access the site" do
      url = "https://t.lever-analytics.com/email-link?dest=https://gitlab.com&eid=17b181e8-271a-4c7e-a909-931a1abe2590&idx=0&token=g_K_AKBfcUMc5kjRdDzmtS2yHtY"

      heartbeat = Heartbeat::Check.new(Spec::Request)

      expect(heartbeat.pulse(url)).to eq(5)
    end   
  end
end
