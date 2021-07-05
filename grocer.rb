
def consolidate_cart(cart)
  updated_cart = {}
  cart.each do |item|
  item.each do |product,info|
    if updated_cart.keys.include?(product)
        updated_cart[product][:count] +=1

      else
        updated_cart[product] = info
        updated_cart[product][:count] = 1
  end
end
end
updated_cart
end


def apply_coupons(cart, coupons)
  with_coupons = {}
   cart.each do |food,food_info|
     coupon.each do |coupon|
       if food ==[:coupon] && food_info[:count] >= coupon[:num]
         food[:count] = info[:count] - coupon[:num]
       elsif with_coupons["#{food} W/COUPON"]
          with_coupons["#{food} W/COUPON"][:count] += 1
        else
          with_coupons["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
end
end
end
with_coupons[food] = food_info
end
with_coupons
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
