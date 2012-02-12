require 'spec_helper'

describe DownloadCodeGenerator do
  let(:download) {
    mock('download').tap do |download|
      @codes = []
      download.stub_chain(:download_codes, :length){@codes.length}
      download.stub_chain(:download_codes, :build) {|hash|
        @codes << {:hash => hash}
      }
    end
  }

  let(:generator) {DownloadCodeGenerator.new(download)}

  describe '#generate' do
    it 'should generate the correct number of codes' do
      generator.generate(5)
      @codes.length.should == 5
    end

    it 'should generate cumulatively' do
      generator.generate(5)
      generator.generate(5)
      @codes.length.should == 10
    end
  end
end
