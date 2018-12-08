require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the CodesHelper. For example:
#
# describe CodesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe CodesHelper do
  it 'paginates through codes' do
    codes = (0..20).map { |i| ('a'.ord + i).chr }
    page_count = 0
    helper.paginate_codes codes do |page|
      case page_count
      when 0 then
        expect(page).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'])
      when 1 then
        expect(page).to eq(['i', 'j', 'k', 'l', 'm', 'n', 'o', 'p'])
      when 2 then
        expect(page).to eq(['q', 'r', 's', 't', 'u'])
      end
      page_count += 1
    end
  end
end
