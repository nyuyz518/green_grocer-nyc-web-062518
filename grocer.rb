def consolidate_cart(cart)
  # code here
  cart.each_with_object({}) do |item, hash|
    item.each do |type, attributes|
      if hash[type]
        attributes[:count] +=1 
      else
        attributes[:count] = 1 
        hash[type] = attributes
      end 
    end 
  end 
end


def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] +=1 
      else 
        cart["#{name} W/COUPON"] = {:count =>1, :price => coupon[:cost]}
        cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
      end 
      cart[name][:count] = cart[name][:count] - coupon[:num]
    end 
  end 
  cart 
end 
    
end

def apply_clearance(cart)
  # code here
  cart.each do |name, properties|
    if properties[:clearance]
      updated_price = properties[:price] * 0.80
      properties[:price] = updated_price.round(2)
    end 
  end 
  cart 
end


def checkout(cart, coupons)
  # code here
  consolidate_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidate_cart, coupons)
  final_cart = apply_clearance(couponed_cart)
  total = 0 
  final_cart.each do |name, properties|
    total += properties[:price] * properties[:count]
  end 
  if total > 100 
  total = total * 0.90 
  total
end
