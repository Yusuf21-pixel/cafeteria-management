class Cart < ActiveRecord::Base
  has_many :cart_items

  def self.tot_amount(id)
    cart = Cart.find(id)
    sum = 0
    cart.cart_items.each do |x|
      sum += (x.quantity * x.menu_item_price).round(2)
    end
    return sum.round(2)
  end
end
