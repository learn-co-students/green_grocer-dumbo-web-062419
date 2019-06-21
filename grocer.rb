#cd development/labs/green_grocer-dumbo-web-062419

require 'pry'

def consolidate_cart(cart)

  consolidated_cart = {}

  cart.each do |item_info|
    item_info.each do |item, info_hash|
      if consolidated_cart[item] == nil
        consolidated_cart[item] = info_hash.merge({:count => 1})
      else
        consolidated_cart[item][:count] += 1
      end
    end
  end
  consolidated_cart
end


#maybe stupid, but, :count was added in consoldated cart- and being used in apply coupons. right? origin of :count in apply coupons?

def apply_coupons(cart, coupons)

  holy_fuckin_hash = cart

  coupons.each do |each_coupon|
    food_name = each_coupon[:item]

    if holy_fuckin_hash[food_name] != nil && holy_fuckin_hash[food_name][:count] >= each_coupon[:num] 
      nuhash = {"#{food_name} W/COUPON" => {
        price: each_coupon[:cost],
        clearance: holy_fuckin_hash[food_name][:clearance], 
        count: 1
        }
      }

      if holy_fuckin_hash["#{food_name} W/COUPON"].nil? #question here for chase
        holy_fuckin_hash.merge!(nuhash)
      else
        holy_fuckin_hash["#{food_name} W/COUPON"][:count] += 1
      end
      holy_fuckin_hash[food_name][:count] -= each_coupon[:num]
    end
  end

  holy_fuckin_hash
end

def apply_clearance(cart)
  cart.each do |item, info_hash|
    if info_hash[:clearance] == true #question here for chase
      info_hash[:price] = (info_hash[:price] * 0.8).round(2)
    end
  end

  cart
end

def checkout(cart, coupons)
  thing1 = consolidate_cart(cart)
  thing2 = apply_coupons(thing1, coupons)
  thing3 = apply_clearance(thing2)

  total = 0
  thing3.each do |name, info_hash|
    total += info_hash[:price] * info_hash[:count]
  end

  if total > 100
    total = total * 0.9
  end
  total
end
