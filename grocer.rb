def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |item|
    item_name = item.keys[0]
    consolidated_cart[item_name] = item.values[0]
    if consolidated_cart[item_name][:count]
      consolidated_cart[item_name][:count]+=1
    else 
      consolidated_cart[item_name][:count]=1
    end
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    coupon_name = coupon[:item]
    coupon_item_num = coupon[:num]
    cart_item = cart[coupon_name]
    next if cart_item.nil? || cart_item[:count] < coupon_item_num
    cart_item[:count] -= coupon_item_num
    coupon_in_cart = cart["#{coupon_name} W/COUPON"]
    if coupon_in_cart
      coupon_in_cart[:count] += 1
    else
      cart["#{coupon_name} W/COUPON"] = { 
        price: coupon[:cost], 
        clearance: cart_item[:clearance], 
        count: 1
      }
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item_name, item_data|
    if item_data[:clearance]
      item_data[:price] = (item_data[:price] * 0.8).round(1)
    end
  end
end

def checkout(cart, coupons)
   total = 0.00
end 	
   cart = consolidate_cart(cart: cart)
  cart = apply_coupons(cart: cart, coupons: coupons)
  cart = apply_clearance(cart: cart)

   cart.each do |food_item, info_hash|
    unless info_hash[:count] == 0
      total += (info_hash[:price] * info_hash[:count])
    end
  end

   total > 100 ? total * 0.90 : total
end
