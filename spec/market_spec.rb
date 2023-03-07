require 'spec_helper'

RSpec.describe Market do
  let(:market) {Market.new("South Pearl Street Farmers Market")} 
  let(:vendor) {Vendor.new("Rocky Mountain Fresh")}
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: '$0.50'})}

  it 'exists' do
    market = Market.new("South Pearl Street Farmers Market")   
     expect(market).to be_a(Market)
  end
end