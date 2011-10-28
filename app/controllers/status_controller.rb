class StatusController < ApplicationController
  def index
    @total_addresses_collected = InterestedParty.total_collected

    respond_to do |format|
      format.html
      format.csv { send_data "email_address", type: "text/csv", filename: "foo.csv", }
    end
  end
end
