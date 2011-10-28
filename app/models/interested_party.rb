class InterestedParty < ActiveRecord::Base
  def self.total_collected
    count
  end
end
