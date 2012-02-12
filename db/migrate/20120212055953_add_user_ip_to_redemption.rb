class AddUserIpToRedemption < ActiveRecord::Migration
  def self.up
    add_column :download_codes, :user_ip, :string
  end

  def self.down
    remove_column :download_codes, :user_ip
  end
end
