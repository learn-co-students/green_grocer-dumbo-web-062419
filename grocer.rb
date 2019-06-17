require 'pry'

def consolidate_cart(cart)
  consolidated_hash = {}
  cart.each do |item|
    item.each do |item_name, item_hash|
        if consolidated_hash.key?(item_name) == false
          consolidated_hash[item_name] = item_hash
          consolidated_hash[item_name][:count] = 1
        else
          consolidated_hash[item_name][:count] += 1
        end
    end
  end
  consolidated_hash
end
