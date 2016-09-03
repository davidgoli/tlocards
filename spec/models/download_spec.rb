require 'spec_helper'

describe Download do
  before do
    @download = Download.new(:artist => 'My Artist', :title => 's/t')
  end

  it 'assigns' do
    expect(@download.title).to eq('s/t')
    expect(@download.artist).to eq('My Artist')
  end
end
