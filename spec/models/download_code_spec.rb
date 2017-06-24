require 'spec_helper'

describe DownloadCode do
  let!(:code) { DownloadCode.new }
  context 'expired?' do
    before do
    end

    it 'is not expired if not redeemed' do
      code.redeemed = false
      expect(code).not_to be_expired
    end

    it 'is not expired if recently redeemed' do
      code.redeemed = true
      code.redeemed_date = 23.hours.ago
      expect(code).not_to be_expired
    end

    it 'is expired if redeemed > 1 day ago ' do
      code.redeemed = true
      code.redeemed_date = 25.hours.ago
      expect(code).to be_expired
    end
  end
end
