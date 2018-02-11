RSpec.describe Heartbeat, "check average site performacne" do
  let (:url) { "https://t.lever-analytics.com/email-link?dest=https://gitlab.com&eid=17b181e8-271a-4c7e-a909-931a1abe2590&idx=0&token=g_K_AKBfcUMc5kjRdDzmtS2yHtY" }

  context "when the site is available" do
    it "should return a numeric value representing the time" do
      time = Heartbeat::Check.new(url, {}, Spec::Request).pulse
      expect(time).to be_a(Numeric)
    end

    it "should return the time taken to access the site" do
      time = Heartbeat::Check.new(url, {}, Spec::Request).pulse
      expect(time.to_i).to eq(1)
    end
  end

  context "when passed with different interval option" do
    it "should return the time taken to access the site" do
      time = Heartbeat::Check.new(url, {interval: 2}, Spec::Request).pulse
      expect(time.to_i).to eq(1)
    end
  end

  context "when passed with different time_to_poll_in_seonds option" do
    it "should return the time taken to access the site" do
      time = Heartbeat::Check.new(url, {time_to_poll: 30}, Spec::Request).pulse
      expect(time.to_i).to eq(1)
    end
  end

  context "when passed with options as nil" do
    it "should return the time taken to access the site" do
      time = Heartbeat::Check.new(url, nil, Spec::Request).pulse
      expect(time.to_i).to eq(1)
    end
  end
end
