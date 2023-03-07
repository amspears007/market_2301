require 'spec_helper'

RSpec.describe Item do
  it 'exists' do
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    expect(item1).to be_a(Item) 
  end
end 