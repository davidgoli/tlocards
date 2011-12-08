class Download < ActiveRecord::Base
  has_attached_file :zipfile, :url => "/:class/:attachment/:id/:basename.:extension"
  attr_accessible :download
end
