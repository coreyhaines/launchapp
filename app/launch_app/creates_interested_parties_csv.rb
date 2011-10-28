module LaunchApp
  class CreatesInterestedPartiesCSV
    def self.for_all
      ([header_line] + InterestedParty.all.map(&:email_address)).join("\n")
    end

    def self.header_line
      "email_address"
    end
  end
end

