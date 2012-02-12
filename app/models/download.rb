class Download < ActiveRecord::Base
  has_many :download_codes

  has_attached_file :zipfile, :url => "/:class/:attachment/:id/:basename.:extension"
  attr_accessible :download, :artist, :title, :release_date

  def redeemed_codes
    download_codes.where(:redeemed => 1)
  end
end
