require 'spec_helper'

describe CodesController, type: :controller do
  describe 'redeem' do
    before do
      get 'redeem'
    end

    it 'assigns a date' do
      expect(assigns[:date]).to be_a DateTime
    end
  end
end
