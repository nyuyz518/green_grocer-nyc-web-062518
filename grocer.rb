def consolidate_cart(cart)
  # code here
  cart.each_with_object({}) do |item, hash|
    item.each do |type, attributes|
      if hash[type]
        attributes[:count] +=1 
      else
        attributes[:count] = 1 
        
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
