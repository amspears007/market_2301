require 'spec_helper'

RSpec.describe Market do
  let(:market) {Market.new("South Pearl Street Farmers Market")} 
  let(:vendor1) {Vendor.new("Rocky Mountain Fresh")}
  let(:vendor2) {Vendor.new("Ba-Nom-a-Nom")}   
  let(:vendor3) {Vendor.new("Palisade Peach Shack")}  

  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: '$0.50'})}
  let(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let(:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}

  it 'exists' do
    market = Market.new("South Pearl Street Farmers Market")   
     expect(market).to be_a(Market)
  end

  it 'has a name and starts with no vendors' do
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end

  it 'can add vendors and stock items' do
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom") 
    vendor3 = Vendor.new("Palisade Peach Shack")  

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7) 
    vendor2.stock(item4, 50) 
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65) 

    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    expect(market.vendors).to eq([vendor1, vendor2, vendor3])
  end

  it 'returns an array of vendor names' do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7) 
    vendor2.stock(item4, 50) 
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65) 

    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)
    expect(market.vendor_names).to match_array(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

  it 'returns a list of Vendors that have that item in stock' do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7) 
    vendor2.stock(item4, 50) 
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65) 

    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)
    expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
    expect(market.vendors_that_sell(item4)).to eq([vendor2])
  end

  describe 'Iteration 3' do
    it 'returns a list of names of all items the Vendors have in stock, sorted alphabetically' do
      market.add_vendor(vendor1)
      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7) 
      expect(market.sorted_item_list).to match_array(['Peach', 'Tomato'])

      market.add_vendor(vendor2)
      vendor2.stock(item4, 50) 
      vendor2.stock(item2, 7) 
      expect(market.sorted_item_list).to match_array(['Banana Nice Cream','Peach', 'Tomato'])
    end

    it 'can list all items and overstocked items' do
      #item is overstocked if it is sold by more than 1 vendor 
      #AND the total quantity is greater than 50.
      market.add_vendor(vendor1)
      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7) 
      market.add_vendor(vendor2)
      vendor2.stock(item1, 50) 
      vendor2.stock(item2, 7) 

      expect(market.all_items).to eq([item1, item2])
      # expect(market.overstocked_items).to eq([item1])

    end

    it 'can list all items' do
    end
  end
end
