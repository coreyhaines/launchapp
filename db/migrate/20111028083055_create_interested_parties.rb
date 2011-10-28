class CreateInterestedParties < ActiveRecord::Migration
  def change
    create_table :interested_parties do |t|
      t.string :email_address

      t.timestamps
    end
  end
end
