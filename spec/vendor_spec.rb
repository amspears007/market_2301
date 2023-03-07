require 'spec_helper'

RSpec.describe Vendor do
  it 'exists and has a name' do
    vendor = Vendor.new("Rocky Mountain Fresh")
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end
end