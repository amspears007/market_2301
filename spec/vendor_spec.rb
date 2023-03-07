require 'spec_helper'

RSpec.describe Vendor do
  let(:vendor)  {Vendor.new("Rocky Mountain Fresh")}
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: '$0.50'})}
  
  it 'exists and has a name' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'starts with no inventory' do
    expect(vendor.inventory).to eq({})
    expect(vendor.check_stock(item1)).to eq(0)
  end
end