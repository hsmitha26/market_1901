class Market

  attr_reader :name, :vendors

  def initialize(market_name)
    @name = market_name
    @vendors = []
  end

  def add_vendor(vendor_object)
    @vendors << vendor_object
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item_name)
    @vendors.find_all do |vendor_object|
      vendor_object if vendor_object.inventory.has_key?(item_name) == true
    end
  end

  def sorted_item_list
    items_array = @vendors.collect do |vendor_object|
      vendor_object.inventory.keys
    end.flatten
    return items_array.uniq.sort
  end

  def total_inventory
    items_array = @vendors.collect do |vendor_object|
      vendor_object.inventory
    end

    inventory_hash = {}
    items_array.map do |item_hash|
      item_hash.each do |key, value|
        inventory_hash.store(key, value)
      end
      return inventory_hash
    end
    #need to 'shovel' each hash and add values.
    #merge would work with arguments where old and new values are added.
  end

end
