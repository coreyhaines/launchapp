require 'creates_interested_parties_csv'
class InterestedParty
end

describe LaunchApp::CreatesInterestedPartiesCSV do
  describe ".header_line" do
    it "is just the email_address" do
      LaunchApp::CreatesInterestedPartiesCSV.header_line.should == "email_address"
    end
  end

  describe ".for_all" do
    before do
      InterestedParty.stub(:all) { interested_parties }
    end

    context "with no interested parties" do
      let(:interested_parties) { [] }
      it "returns just the headers" do
        LaunchApp::CreatesInterestedPartiesCSV.for_all.should == LaunchApp::CreatesInterestedPartiesCSV.header_line
      end
    end

    context "with a single interested party" do
      let(:address) { "qux@example.com" }
      let(:interested_parties) { [stub(email_address: address)] }
      it "includes their email address" do
        InterestedParty.stub(:all) { interested_parties }
        LaunchApp::CreatesInterestedPartiesCSV.for_all.split("\n")[1].should == address
      end
    end
  end
end
