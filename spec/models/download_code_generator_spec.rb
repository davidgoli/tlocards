require 'spec_helper'

describe DownloadCodeGenerator do
  let(:download) {
    double('download').tap do |download|
      @codes = []
      allow(download).to receive_message_chain(:download_codes, :length){@codes.length}
      allow(download).to receive_message_chain(:download_codes, :build) {|hash|
        @codes << {:hash => hash}
      }
    end
  }

  let(:generator) {DownloadCodeGenerator.new(download)}

  describe '#generate' do
    it 'generates the correct number of codes' do
      generator.generate(5)
      expect(@codes.length).to eq 5
    end

    it 'should generate cumulatively' do
      generator.generate(5)
      generator.generate(5)
      expect(@codes.length).to eq 10
    end
  end
end
