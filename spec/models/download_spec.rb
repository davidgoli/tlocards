require 'spec_helper'

describe Download do
  before do
    @download = Download.new(:artist => 'My Artist', :title => 's/t')
  end

  it 'should assign' do
    @download.title.should == 's/t'
    @download.artist.should == 'My Artist'
  end
end
