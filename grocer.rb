require 'pry'

def consolidate_cart(cart)
  #binding.pry
  organized_cart = {}
  count = 0
  cart.each do |element|
  #binding.pry
    element.each do |fruit, hash|
      organized_cart[fruit] ||= hash
      organized_cart[fruit][:count] ||= 0
      organized_cart[fruit][:count] += 1
    end
  end
  return organized_cart
end

