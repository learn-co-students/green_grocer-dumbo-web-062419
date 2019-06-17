require 'pry'

def consolidate_cart(cart)
  organized_cart = {}
  count = 0
  cart.each do |element|
    element.each do |fruit, hash|
      organized_cart[fruit] ||= hash
      organized_cart[fruit][:count] ||= 0
      organized_cart[fruit][:count] += 1
    end
  end
  return organized_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1
      else
        cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
        cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
      end
      cart[name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
 cart.each do |fruit_name,fruit_hash|
   if fruit_hash[:clearance] == true
     fruit_hash[:price] = (fruit_hash[:price]*0.8).round(2)
   end
 end
 return cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
end

test_cart = {
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 4},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}

test_coupon =
[
		{:item => "AVOCADO", :num => 2, :cost => 5.00},
		{:item => "BEER", :num => 2, :cost => 20.00},
		{:item => "CHEESE", :num => 3, :cost => 15.00}
	]
