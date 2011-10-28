require 'spec_helper'

describe InterestedParty do
  describe ".total_collected" do
    it "returns the number of interested parties" do
      10.times do |index|
        InterestedParty.create email_address: "party#{index}@example.com"
      end

      InterestedParty.total_collected.should == 10
    end
  end
end
