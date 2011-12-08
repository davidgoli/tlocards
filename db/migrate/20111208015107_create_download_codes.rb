class CreateDownloadCodes < ActiveRecord::Migration
  def self.up
    create_table :download_codes do |t|
      t.integer  :download_id
      t.string   :code
      t.string   :email
      t.datetime :redeemed_date
      t.boolean  :redeemed, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :download_codes
  end
end
