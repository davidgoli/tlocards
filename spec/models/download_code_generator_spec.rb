require 'spec_helper'

describe DownloadCodeGenerator do
  let(:download) {
    returning(mock('download')) do |download|
      codes = []
      download.stub_chain(:download_codes, :length){codes.length}
      download.stub_chain(:download_codes, :build) {|hash|
        codes << {:hash => hash}
      }
      download.stub(:download_codes){codes}
    end
  }

  let(:generator) {DownloadCodeGenerator.new(download)}

  describe '#generate' do
    before do
      generator.generate(5)
    end

    it 'should generate the correct number of codes' do
      download.download_codes.length.should == 5
    end
  end
end