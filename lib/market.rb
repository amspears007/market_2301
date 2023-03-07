class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors.find_all do |vendor|
      vendor.inventory.keys.include?(item)
    end
  end

  def sorted_item_list
    items = vendors.map do |vendor|
      vendor.inventory.map do |item, price|
        item.name
      end
    end
    items.flatten.sort.uniq
  end

  def overstocked_items
    all_items.find_all do |item|
     
    end
    #   require 'pry'; binding.pry
    # end
    # total_quantity = vendors.map do |vendor|
    #   vendor.inventory.map do |item, amount|
    #     amount
      # end
    end
  # end

  def all_items
    vendors.map do |vendor|
      vendor.inventory.keys
    end
    .flatten.uniq
  end

  def total_quantity(item)
    vendors.sum do |vendor|
      vendor.check_stock(item)
    end
  end
end
