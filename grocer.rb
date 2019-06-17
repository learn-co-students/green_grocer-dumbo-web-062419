def consolidate_cart(cart)
  # code here
  cons_cart = {}
  cart.each do |item|
  	item_name = item.keys[0]
  	unless cons_cart.has_key? item_name
  		cons_cart[item_name] = item[item_name]
  		cons_cart[item_name][:count] = 0
  	end
  	cons_cart[item_name][:count] += 1
  end
  cons_cart
end

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|
  	# we are now considering a particular coupon
  	item_name = coupon[:item]
  	new_key = item_name + " W/COUPON"
  	if cart[item_name] != nil && cart[item_name][:count] >= coupon[:num]
  		cart[item_name][:count] = cart[item_name][:count] - coupon[:num]
	  	unless cart.has_key? new_key
	  		cart[new_key] = {:price => coupon[:cost], :clearance => cart[item_name][:clearance], :count => 0}
	  	end
	  	cart[new_key][:count] += 1
  	end
	end
	cart
end

def apply_clearance(cart)
  # code here
  cart.each do |item_name, stat|
  	if stat[:clearance]
  		stat[:price] *= 0.8
  		stat[:price] = stat[:price].round(1)
  	end
  end
  cart
end

def checkout(cart, coupons)
  # code here
  total = 0
  cart = consolidate_cart cart
  cart = apply_coupons cart, coupons
  cart = apply_clearance cart

  cart.each do |item, data|
  	total += data[:price] * data[:count]
  end

  total > 100 ? total * 0.9 : total
end