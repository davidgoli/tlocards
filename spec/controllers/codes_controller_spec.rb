require 'spec_helper'

describe CodesController do
  describe 'redeem' do
    before do
      get 'redeem'
    end

    it 'should assign a date' do
      assigns[:date].should be_a DateTime
    end
  end
end
