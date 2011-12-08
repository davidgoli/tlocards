class AddFieldsToDownload < ActiveRecord::Migration
  def self.up
    add_column :downloads, :artist, :string
  end

  def self.down
    remove_column :downloads, :artist
  end
end
