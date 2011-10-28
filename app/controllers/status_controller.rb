class StatusController < ApplicationController
  def index


    respond_to do |format|
      format.html do
        @total_addresses_collected = InterestedParty.total_collected
      end
      format.csv do
        send_data LaunchApp::CreatesInterestedPartiesCSV.for_all, type: "text/csv", filename: "foo.csv"
      end
    end
  end
end
