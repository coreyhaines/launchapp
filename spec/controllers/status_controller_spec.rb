require 'spec_helper'

describe StatusController do

  describe "GET 'index'" do
    it "provides the number of email addresses collected" do
      InterestedParty.stub(:total_collected) { 5 }
      get :index
      assigns[:total_addresses_collected].should == 5
    end

    context "as a csv file" do
      before do
        LaunchApp::CreatesInterestedPartiesCSV.stub(:for_all)
      end
      it "supports it" do
        get :index, format: :csv
        response.should be_success
        response.content_type.should == 'text/csv'
      end

      it "includes the email addresses collected" do
        LaunchApp::CreatesInterestedPartiesCSV.stub(:for_all) { "this is the csv" }
        get :index, format: :csv
        response.body.should == "this is the csv"
      end
    end
  end
end
