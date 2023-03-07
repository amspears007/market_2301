require 'spec_helper'

RSpec.describe Vendor do
  let(:vendor)  {Vendor.new("Rocky Mountain Fresh")}
  
  it 'exists and has a name' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'starts with no inventory' do
    expect(vendor.inventory).to eq({})
    expect(vendor.check_stock(item)).to eq(0)
  end
end