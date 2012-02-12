class DownloadCode < ActiveRecord::Base
  belongs_to :download
  validates_uniqueness_of :code
  attr_reader :redeemed

  def expired?
    redeemed? && redeemed_date < 1.day.ago
  end
end
