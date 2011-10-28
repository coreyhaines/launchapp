class StatusController < ApplicationController
  def index
    @total_addresses_collected = InterestedParty.total_collected
  end
end
