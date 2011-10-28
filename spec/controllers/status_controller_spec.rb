require 'spec_helper'

describe StatusController do

  describe "GET 'index'" do
    it "provides the number of email addresses collected" do
      InterestedParty.stub(:total_collected) { 5 }
      get :index
      assigns[:total_addresses_collected].should == 5
    end
  end
end
