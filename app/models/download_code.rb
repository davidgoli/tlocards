class DownloadCode < ActiveRecord::Base
  belongs_to :download
  validates_uniqueness_of :code
  attr_reader :redeemed?
end
