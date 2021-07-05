# binding.pry
require 'pry'

# Input:
# [
#   {"AVOCADO" => {:price => 3.0, :clearance => true }},
#   {"AVOCADO" => {:price => 3.0, :clearance => true }},
#   {"KALE"    => {:price => 3.0, :clearance => false}}
# ]
def consolidate_cart(cart)
  # code here
  new_cart = {}

  cart.each do |grocery_item|
    grocery_item.each do |grocery_item_name, grocery_item_pricing_data|
      if new_cart.has_key?(grocery_item_name) == false
        new_cart[grocery_item_name] = grocery_item_pricing_data
        new_cart[grocery_item_name][:count] = 1
      else
        new_cart[grocery_item_name][:count] += 1
      end
    end
  end

  new_cart
end
# Expected ouput:
# {
#   "AVOCADO" => {:price => 3.0, :clearance => true, :count => 2},
#   "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
# }



# Input:
# cart = {
#   "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
#   "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
# }
# coupons = {:item => "AVOCADO", :num => 2, :cost => 5.0}
def apply_coupons(cart, coupons)
  # code here
  grocery_item_with_coupon_name = ""
  discounted_grocery_item_name = ""
  num_coupons = nil

  coupons.each do |coupon|
    coupon.each do |coupon_attribute_key, coupon_attribute_value|

      if cart.has_key?(coupon_attribute_value)
        grocery_item_with_coupon_name = coupon_attribute_value + " W/COUPON"
        cart[grocery_item_with_coupon_name] = {}
        cart[grocery_item_with_coupon_name][:count] = 1
        discounted_grocery_item_name = coupon_attribute_value
      end

      if coupon_attribute_key == :cost
        cart[grocery_item_with_coupon_name][:price] = coupon_attribute_value
      end

      if coupon_attribute_key == :num
        num_coupons = coupon_attribute_value
      end

    end
  end # End iterating through coupons

  cart.each do |grocery_item_name, all_grocery_item_pricing_data|
    all_grocery_item_pricing_data.each do |px_clearance_cnt_key, px_clearance_cnt_value|

      if px_clearance_cnt_key == :clearance
        cart[grocery_item_with_coupon_name][px_clearance_cnt_key] = px_clearance_cnt_value
      end

      if px_clearance_cnt_key == :count && grocery_item_name == discounted_grocery_item_name
        cart[grocery_item_name][:count] -= num_coupons
      end

    end
  end # End iterating through cart

  cart
end
# Output:
# {
#   "AVOCADO" => {:price => 3.0, :clearance => true, :count => 1},
#   "KALE"    => {:price => 3.0, :clearance => false, :count => 1},
#   "AVOCADO W/COUPON" => {:price => 5.0, :clearance => true, :count => 1},
# }



# Discount the price of every item on clearance by twenty percent.
# Input:
# Cart = {
  # "PEANUTBUTTER" => {:price => 3.00, :clearance => true,  :count => 2},
  # "KALE"         => {:price => 3.00, :clearance => false, :count => 3}
  # "SOY MILK"     => {:price => 4.50, :clearance => true,  :count => 1}
# }
def apply_clearance(cart)
  # code here
  old_cart = cart

  cart.each do |grocery_item_name, all_grocery_item_pricing_data|
    all_grocery_item_pricing_data.each do |px_clearance_cnt_key, px_clearance_cnt_value|
      if px_clearance_cnt_key == :clearance && px_clearance_cnt_value == true
        cart[grocery_item_name][:price] *= 0.8
      end
    end
    binding.pry
  end

  cart
end
# Output
# {
#   "PEANUTBUTTER" => {:price => 2.40, :clearance => true,  :count => 2},
#   "KALE"         => {:price => 3.00, :clearance => false, :count => 3}
#   "SOY MILK"     => {:price => 3.60, :clearance => true,  :count => 1}
# }


def checkout(cart, coupons)
  # code here
end
