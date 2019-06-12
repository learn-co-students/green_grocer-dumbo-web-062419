def consolidate_cart(cart)
  new_cart = {}
  count = :count
  cart.each do |i|
    i.each do |j, h|
        if !new_cart.has_key?(j)
          new_cart[j] = h
          new_cart[j][:count] = 1
        else
          new_cart[j][:count] += 1
        end
    end
  end
  new_cart
end

#This is k AVOCADO
#This is v {:price=>3.0, :clearance=>true, :count=>2}

def apply_coupons(cart, coupons)
  coup_cart = {}
  cart.each do |k, v|
    coupons.each do |i|
      if k == i[:item] && v[:count] >= i[:num]
        v[:count] = v[:count] - i[:num]
        if coup_cart["#{k} W/COUPON"]
          coup_cart["#{k} W/COUPON"][:count] += 1
        else
          coup_cart["#{k} W/COUPON"] = {price: i[:cost], clearance: v[:clearance], count: 1}
        end
      end
    end
    coup_cart[k] = v
  end
  coup_cart
end

def apply_clearance(cart)
  cart.each do |k, v|
    if v[:clearance] == true
      v[:price] = (v[:price] * 0.8).round(1)
    end
  end
  cart
end

# i = "BEETS"
# info = {:price=>2.5, :clearance=>false, :count=>1}

def checkout(cart, coupons)
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  cart_total = 0

  cart.each do |i, info|
    cart_total += ((info[:price] * info[:count]).to_f).round(1)
  end
  if cart_total > 100
    return (cart_total * 0.9)
  else
    return cart_total
  end
end
