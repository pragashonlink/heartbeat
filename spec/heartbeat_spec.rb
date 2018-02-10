RSpec.describe Heartbeat, "check average site performacne" do
  context "when the site is available" do
    it "should return a numeric value representing the time" do
      url = "https://t.lever-analytics.com/email-link?dest=https://gitlab.com&eid=17b181e8-271a-4c7e-a909-931a1abe2590&idx=0&token=g_K_AKBfcUMc5kjRdDzmtS2yHtY"

      heartbeat = Heartbeat::Check.new(url)

      expect(heartbeat.pulse).to be_a(Numeric)
    end
  end
end
