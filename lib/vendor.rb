class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new{|hash, key| hash[key] = 0}
  end

  def check_stock(item_name)
    @inventory[item_name]
  end

  def stock(item_name, item_count)
    @inventory[item_name] += item_count
  end
end
